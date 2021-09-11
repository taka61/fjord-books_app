# frozen_string_literal: true

class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_to user_path(user)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to user_path(params[:user_id])
  end
end
