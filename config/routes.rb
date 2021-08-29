Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'

  resources :users do
    get :following, :followers, on: :member
  end
  resources :books
  resources :users, only: %i(index show)
  resources :relationships, only: %i(create destroy)
end
