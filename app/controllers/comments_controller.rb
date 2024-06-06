class CommentsController < ApplicationController

    before_action :authenticate_user!

    def index

    end

    def create
        puts comment_params
    end

    def show
    end

    def destroy
    end


    private

    def comment_params
        params.require(:comment).permit(:text, :user_id, :post_id)
    end
end
