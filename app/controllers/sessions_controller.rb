class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    
    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user 
            login(@user)
            redirect_to subs_url
        else
            flash[:errors] = ["Username or Password is invalid"]
            render :new
        end
    end

    def new
        @user = User.new
    end

    def destroy
        logout
        redirect_to new_session_url
    end
end
