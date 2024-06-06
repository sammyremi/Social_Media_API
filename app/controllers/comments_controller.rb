class CommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :find_post
    before_action :find_comment, only: [:update]

    def index

    end

    def create
        @post_comment = @post.comments.create(comment_params)
        if @post_comment.persisted?
            render json: {response: "created successfully"}, status: :created
        else
            render json: {response: "not created", error: @post_comment.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
    end

    def update
        render json: @comments
        if @comment.update(comment_params)
            render json: {response: "updated comment successfully", comment: @comment}, status: :ok
        else
            render json: {response: "can't update comment", error: @comment.errors.full_messages}, status: :unprocessable_entity
        end
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

    def find_comment
        @comment = @post.comments.find(params[:id])
    end
end
