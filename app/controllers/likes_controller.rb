class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post

    def create
        @comments = @post.comments
        puts params
    end

    def destroy
    end

    private

    # def likes_params

    # end

    def find_post
        @post = Post.find(params[:post_id])
    end

    
end
