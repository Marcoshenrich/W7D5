class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        if @post.save!
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.author_id == current_user.id && @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if @post.author_id == current_user.id
            @post.destroy
        end
        redirect_to subs_url
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids:[])
    end
end
