class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show, :index, :destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to subs_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user 
            @user.destroy
        end
        redirect_to users_url
    end

    def index
        @users = User.all
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
