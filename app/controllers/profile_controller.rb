class ProfileController < ApplicationController

    before_action :authenticate_user!

    before_action :set_user


    def follow
        current_user.send_follow_request_to(@user) if current_user
        render json: {message: " #{current_user.email} sent follow request sent to #{@user.email}"}, status: :ok
    end

    def accept
        current_user.accept_follow_request_of(@user)
        render json: {meassage: "You are now following #{@user.email}"}, status: :ok
    end


    private

    def set_user
        @user = User.find(params[:id])
    end
end
