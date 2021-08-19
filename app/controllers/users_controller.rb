class UsersController < ApplicationController
  def index
    @user = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id]) #追記
  end
end
