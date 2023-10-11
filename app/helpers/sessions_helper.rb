module SessionsHelper
#セッションに利用者IDを保存する
    def log_in(user)
        session[:user_id] = user.id
    end

#利用者IDをキーにして利用者情報を保存する
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

#利用者がログインしているかどうかを真偽値を返す
    def logged_in?
        !current_user.nil?
    end

#利用者がログインしていないければログイン画面に遷移する
    def require_login
        redirect_to login_path if !logged_in?
    end

#ログアウトする
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
