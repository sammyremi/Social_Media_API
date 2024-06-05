class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post, only: [:destroy, :update, :show]

    def index
        @posts = Post.where(user_id: current_user.id)
        render json: @posts, status: :ok
    end

    def create
        @post = Post.create(post_params)
        if @post.persisted?
          render json: { message: "post created", post: @post }, status: :created
        else
          render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        render json: {post: @post}
    end


    def update
        if @post.update(post_params)
            render json: { message: "Post updated successfully", post: @post }, status: :ok
        else
            render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @post = find_post
        if @post.destroy
            render json: {message: "Post Deleted"}, status: :ok
        end
    end


    private 


    def post_params
        params.require(:post).permit(:title, :user_id, images: [])
    end

    def find_post
        @post = Post.find(params[:id])
    end

    
end
