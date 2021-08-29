class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:follow_id])
    current_user.follow(params[:follow_id])
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id]).followings
    current_user.unfollow(params[:id])
    redirect_to user_path
  end

end
