class SessionsController < ApplicationController
    def new
        if current_user
            redirect_to :root
        else
            @form =LoginForm.new
            render acion: 'new'
        end
    end

    def create
        @form=LoginForm.new(login_params)

        if @form.account.present?
            user=User.find_by(account:@form.account,password:@form.password)
        end
        if user
            session[:user_id]=user.id
            redirect_to :top
        else
            flash.now.alert = "ログインに失敗しました"
            render "new"
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to :login
    end

#パラメータ定義
    private
    def login_params
        params.require(:login_form).permit(
            :account,:password
        )
    end

end
