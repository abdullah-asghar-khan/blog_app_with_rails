# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resource :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  # get "/users/:id/posts/:id", to "posts#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
