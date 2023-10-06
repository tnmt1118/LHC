class UsersController < ApplicationController
    def def new
        @user = User.new
    end

    def create
        @User = User.new(user_params)
        if @user.save
            redirect_to profile_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to signup_path
    end

    private
        def user_params
            params.repuire(:user).permit(:email, :password, :password_confirmation, :name)
        end
end