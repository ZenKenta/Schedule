class PersonalSchedulesController < ApplicationController

    def index
    #    @personal_schedules=PersonalSchedule.where(eventid: params[:eventid])
        @eventid=params[:eventid]
        @nittei_cyosei=NitteiCyosei.where(eventid:params[:eventid]).order(:nengetsuhi)
        @schedule_list=PersonalSchedule.where(eventid: params[:eventid]).order(:shimei,:nengetsuhi)

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
        flash.notice=params[:personal_schedules]
        redirect_to request.referer          

    end

    def update
        personal_schedules=[]
        
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
    def update_params
        params.permit(personal_schedules:[:nengetsuhi,:value])[:personal_schedules]
           
    end

    def personal_schedules_params
        params.require(:personal_schedules).map do |p|
            ActionController::Parameters.new(p.to_hash).permit(:eventid,:nengetsuhi,:shimei,:value)
        end   
    end

end