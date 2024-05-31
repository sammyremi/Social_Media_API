class FeedsController < ApplicationController
  before_action :authenticate_user!

  # find users current user is folloing and display posts as feeds
  def show
    @posts = current_user.following.map { |user| user.posts}
    render json: {feeds: @posts}
  end

end
