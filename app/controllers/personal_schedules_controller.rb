class PersonalSchedulesController < Common

    def index
        #受け渡し用イベントIDのセット
        @eventid=params[:eventid]
        #候補日取得
        @nittei_cyosei=NitteiCyosei.where(eventid:params[:eventid]).order(:nengetsuhi)
        #出欠内容取得
        @schedule_list=PersonalSchedule.where(eventid: params[:eventid]).order(:shimei,:nengetsuhi)
        #出欠合計数取得
        @goukei_list=PersonalSchedule.where(eventid: params[:eventid]).group("TO_CHAR(nengetsuhi,'YYYY-MM-DD')",:value).count
 
        #新規と更新の判別処理
        if params[:shimei].present?
            @personal_schedules=PersonalSchedule.where(eventid: params[:eventid]).where(shimei:params[:shimei]).order(:nengetsuhi)
        else
            @personal_schedules=(1..@nittei_cyosei.count).map do
                PersonalSchedule.new
            end
        end
    end

    def create
        personal_schedules=[]

        personal_schedules_params.each do |p|
            personal_schedule = PersonalSchedule.new(p)
            if personal_schedule.save
                personal_schedules << personal_schedule
            end
        end
        @eventid=params[:eventid]

        flash.notice='候補日を追加しました'
        redirect_to request.referer          

    end

    def update      
        @personal_schedule = update_params.map do |id, param|
        personal_schedule = PersonalSchedule.find(id)
        personal_schedule.update_attributes(param)
        personal_schedule.save
    end
        @eventid=params[:eventid]

        flash.notice='候補日を更新しました'
        redirect_to request.referer 
    end


    #パラメータ定義
    private
    #更新時利用パラメータ
    def update_params
        params.permit(personal_schedules:[:nengetsuhi,:value])[:personal_schedules]
           
    end

    #新規作成時パラメータ
    def personal_schedules_params
        params.require(:personal_schedules).map do |p|
            ActionController::Parameters.new(p.to_hash).permit(:eventid,:nengetsuhi,:shimei,:value)
        end   
    end

end