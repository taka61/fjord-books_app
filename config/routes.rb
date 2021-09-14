Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  root to: 'books#index'

  resources :books
  resources :users, only: %i(index show)
  resources :users do
    get :followings, :followers, on: :member
    post 'relationships', to: 'relationships#create'
    delete 'relationships', to: 'relationships#destroy'
  end
end
