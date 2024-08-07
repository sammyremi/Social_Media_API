class Api::V1::LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_likeable
    before_action :find_like, only: [:destroy]

    #create like for post or comment if it does not exist
    def create
        if @like_item.likes.exists?(user_id: current_user.id)
            render json: {message: "you already liked this"}, status: :unprocessable_entity
    
        else
            @like = Like.new(user: current_user, likeable: @like_item)
            if @like.save
                render json: {message: "you liked #{@like}"}, status: :ok
            else
                render json: {response: @like.errors.full_messages}, status: :unprocessable_entity
            end
        end
    end

    def destroy
        if @like.destroy
            render json: {message: "you have unlike item"}
        end
    end

    private

    def set_likeable
        #find the post to like
        @post = Post.find(params[:post_id])

        #get comment and post id
        @post_id = params[:post_id]
        @comment_id = params[:comment_id]

        # set like to either post or comment
        if @comment_id.present?
            @like_item = @post.comments.find(@comment_id)
        else
            @like_item = @post
        end
    end

    def find_like
        @like = Like.find(params[:id])
    end

    
end
