class CommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :find_post

    def index

    end

    def create
        puts comment_params, params[:post_id], "kkkk"

        render json: @post
    end

    def show
    end

    def destroy
    end


    private

    def comment_params
        params.require(:comment).permit(:text, :user_id, :post_id)
    end

    def find_post
        @post = Post.find(params[:post_id])
    end
end
