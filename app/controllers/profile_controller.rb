class ProfileController < ApplicationController

    before_action :authenticate_user!

    before_action :set_user


    def follow
        status = current_user.following?(@user)
        render json: {message: status}
    end


    private

    def set_user
        @user = User.find(params[:id])
    end
end
