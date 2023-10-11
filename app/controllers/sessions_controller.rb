class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def new
    end

    def create
        user = User.find_by(email:params[:email].downcase)
        if user && user.authenticate(params[:password])
            log_in(user)
            redirect_to profile_path(user)
        else
            flash.now[:danger] = 'メールアドレスカパスワードが間違っています。'
            render 'new'
        end
    end

    def destroy
        log_out
        redirect_to login_path
    end
end
