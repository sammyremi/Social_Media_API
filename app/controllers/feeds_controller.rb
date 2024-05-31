class FeedsController < ApplicationController
  before_action :authenticate_user!
  def show
    
    
  end

  private 

  def find_following
    @users =  current_user.following
  end
end
