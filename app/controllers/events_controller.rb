class EventsController < ApplicationController
    def index
        #有効,中止の習得
        @events=Event.where(status: ['0','1']).order(:start_date).page(params[:page])
 #       @events =Event.where(status: ['0','1']).order(:id).limit(10).offset(10)
    end

    def new
        @event =Event.new
    end

    def create
        @event=Event.new(event_params)
        if @event.save
            flash.notice='イベントを新規登録しました。'
            redirect_to :events
        else
            render action: new
        end
    end

    def edit
        @event=Event.find(params[:id])
        @kouhobisu=NitteiCyosei.where(eventid: params[:id]).count
    end

    def update
        @event=Event.find(params[:id])
        @event.assign_attributes(event_params)
        if @event.save
            flash.notice='イベントを更新しました'
            redirect_to :events
        else
            render action:'edit'
        end
    end

#パラメータ定義
    private 
    def event_params
    params.require(:event).permit(
        :name,:start_date,:end_date,:place,:detail,:status
    )
    end

end