# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'users/index' => 'users#index'
    get 'users/show' => 'users#show'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :books
  resources :users, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
