# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  # resources :users
  
  get '/users', to: 'users#index'

  get '/users/:user_id', to: 'users#show', as: 'user'

  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

  get '/users/:user_id/posts/new', to: 'posts#new'

  get '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'

  post '/users/:user_id/posts/create', to: 'posts#create'

  get 'users/:user_id/posts/:post_id/comments/new', to: 'comments#new'

  post 'users/:user_id/posts/:post_id/comments/create', to: 'comments#create'

  post 'users/:user_id/posts/:post_id/likes/create', to: 'likes#create'

  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end
 
end
