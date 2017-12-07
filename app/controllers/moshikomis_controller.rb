class MoshikomisController < ApplicationController

    def index
        unless current_user
             redirect_to :login       
        end
        @eventid=params[:eventid]
        #有効,中止のイベント習得
        @moshikomis=Moshikomi.where(eventid: params[:eventid]).where(status: ['0','1']).order(:status,:shimei).page(params[:page])
        #合計人数の習得
        @m_goukei=Moshikomi.where(eventid: params[:eventid]).where(status: ['0']).sum(:male)
        @f_goukei=Moshikomi.where(eventid: params[:eventid]).where(status: ['0']).sum(:female)

    end

    def new
        @event=Event.find(params[:eventid])
        @moshikomi=Moshikomi.new
    end
    
    def create
        @moshikomi=Moshikomi.new(moshikomi_params)
        if @moshikomi.save
            #flash.notice='参加申込が完了しました。'
            render :action => 'complete'
        end
    end

    def edit
        unless current_user
             redirect_to :login       
        end
        @moshikomi=Moshikomi.find(params[:id])
    end

    def update
        @moshikomi=Moshikomi.find(params[:id])
        @moshikomi.assign_attributes(moshikomi_params)
        if @moshikomi.save
            flash.notice='参加者情報を更新しました'
            redirect_to request.referer
        else
            render action:'edit'
        end
    end

#パラメータ定義
    private 
    def moshikomi_params
    params.require(:moshikomi).permit(
        :eventid,:shimei,:email,:lineId,:email,:male,:femail,:status
    )
    end

end
