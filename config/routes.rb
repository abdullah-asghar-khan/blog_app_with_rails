# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # get 'likes/create
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resource :users
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: :create
    end
  end
end
