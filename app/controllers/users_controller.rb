# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.page(params[:page]).order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
end
