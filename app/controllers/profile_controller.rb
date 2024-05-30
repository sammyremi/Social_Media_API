class ProfileController < ApplicationController

    before_action :authenticate_user!

    before_action :set_user


    def follow
        current_user.send_follow_request_to(@user)
        render json: {message: " #{current_user.email} sent follow request sent to #{@user.email}"}, status: :ok
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
