# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:create]
    end 
  end

  post '/users/:id/posts/:post_id/like', to: 'posts#like', as: 'post_like'
  namespace :api do
    resources :users, only: [] do
      resources :posts, only: [:index]
      resources :posts, only: [] do
        resources :comments, only: [:index, :create], controller: 'comments'
      end
    end
  end
  
end
