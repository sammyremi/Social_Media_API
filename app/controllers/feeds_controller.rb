class FeedsController < ApplicationController
  before_action :authenticate_user!


  # find users current_user is folloing and display posts as feeds
# Controller
  def index
    @following_posts = current_user.following.map { |user| user.posts }.flatten
    
    render json: @following_posts.page(2)
  end


end
