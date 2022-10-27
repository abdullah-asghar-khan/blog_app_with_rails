# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'likes/create
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resource :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: :create
    end
  end
  # get "/users/:id/posts/:id", to "posts#show"
end
