class FeedsController < ApplicationController
  before_action :authenticate_user!


  # find users current_user is folloing and display posts as feeds
# Controller 
# paginate returned feeds with Kaminari paginate gem
  def index
    @following_posts = current_user.following.map { |user| user.posts }.flatten
    @paginated_posts = Kaminari.paginate_array(@following_posts).page(params[:page]).per(params[:per_page] || 10)
    
    render json: {
      feeds: @paginated_posts
    }
  end
end
