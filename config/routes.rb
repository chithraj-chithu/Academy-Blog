# frozen_string_literal: true

Rails.application.routes.draw do
  get 'blogs/index'
  get '/home', to: 'home#index'
  get '/aboutus', to: 'home#aboutus'
  resources :users
  resources :blogs
  # root 'home/index'
  get '/blog/comment/:blog_id', to: 'comments#new_comment'
  post '/comment/create/:blog_id', to: 'comments#comment_create'
  get '/comment/delete/:blog_id', to: 'comments#delete'
  post '/blogs/reaction/:blog_id', to: 'blogs#reaction'
  put '/blogs/reaction/:reaction_id', to: 'blogs#reaction_update'
  delete '/blogs/reaction/:reaction_id', to: 'blogs#reaction_delete'
  get '/signin', to: 'sessions#new', as: :new_sessions
  post '/signin', to: 'sessions#create', as: :sessions
  post '/updates/new', to: 'home#update_new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
