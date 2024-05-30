class ProfileController < ApplicationController

    before_action :authenticate_user!

    before_action :set_user

    def show
        render json: {user: @user}, status: :ok
    end


    def follow
        current_user.send_follow_request_to(@user) if current_user
        render json: {message: " #{current_user.email} sent follow request sent to #{@user.email}"}, status: :ok
    end

    def accept
        current_user.accept_follow_request_of(@user)
        render json: {meassage: "You are now following #{@user.email}"}, status: :ok
    end

    def decline
        current_user.decline_follow_request_of(@user)
        render json: {meassage: "You decline #{@user.email} request"}, status: :ok
    end

    def unfollow
        current_user.unfollow(@user)
        render json: {meassage: "You unfollowed #{@user.email}"}, status: :ok
    end

    def remove_request
        current_user.remove_follow_request_for(@user)
        render json: {meassage: "You cancel request to follow #{@user.email}"}, status: :ok
    end
    

    private

    def set_user
        @user = User.find(params[:id])
    end
end
