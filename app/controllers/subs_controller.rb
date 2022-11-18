class SubsController < ApplicationController
    before_action :require_logged_in, except:[:index, :show]

    def new
        @sub = Sub.new
    end

    def create
        @sub = Sub.new(subs_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            render :new
        end
    end

    def index
        @subs = Sub.all
    end

    def show
        @sub = Sub.find_by(id: params[:id])
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.moderator_id == current_user.id && @sub.update(subs_params)
            redirect_to sub_url(@sub)
        else
            render :edit
        end
    end

    private
    def subs_params
        params.require(:sub).permit(:title, :description)
    end

end
