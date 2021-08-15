# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    @books = Book.page(params[:page]).per(5).order(:created_at, :id).to_sql
  end
end
