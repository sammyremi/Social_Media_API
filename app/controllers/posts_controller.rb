class PostsController < ApplicationController

    respond_to :json

    def index
        @posts = Post.all
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
        @post = set_post_id
    end


    def update
    end

    def destroy
    end


    private 


    def post_params
        params.require(:post).permit(:title, :id, :user_id)
    end

    def set_post_id
        @post = Post.find(post_params[:id])
    end

    
end
