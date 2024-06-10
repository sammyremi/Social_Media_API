class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_likeable

    def create
        @like = Like.new(user: current_user, likeable: @like_item)
        if @like.save
            render json: {response: "Like created successfully"}, status: :ok
        else
            render json: {response: @like.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    # def likes_params

    # end

    def set_likeable
        @post = Post.find(params[:post_id])

        @post_id = params[:post_id]
        @comment_id = params[:comment_id]

        if @comment_id.present?
            @like_item = @post.comments.find(@comment_id)
        else
            @like_item = @post
        end
    end

    def find_like
        
    end

    
end
