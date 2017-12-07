class NitteiCyoseisController < Common

    def index
            @eventid=params[:eventid]
            @nittei_cyoseis=NitteiCyosei.where(eventid: params[:eventid]).order(:nengetsuhi)
            @nittei_cyosei=NitteiCyosei.new
    end

    def create
        @nittei_cyosei=NitteiCyosei.new(nitteicyosei_params)
  
        if @nittei_cyosei.save
            flash.notice='候補日を追加しました'
            redirect_to request.referer
        else
            flash.alert='エラー'
            redirect_to :nittei_cyoseis
        end

    end

    def destroy
        nittei_cyosei=NitteiCyosei.find(params[:id]) 
        nittei_cyosei.destroy!
        flash.notice='候補日を削除しました'
        redirect_to request.referer        
    end

#パラメータ定義
    private 
    def nitteicyosei_params
    params.require(:nittei_cyosei).permit(
        :eventid,:nengetsuhi
    )
    end

end
