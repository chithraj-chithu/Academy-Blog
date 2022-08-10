# frozen_string_literal: true

Rails.application.routes.draw do
  get 'blogs/index'
  root 'home#index'
  resources :users
  resources :blogs
  post '/comments/:blog_id', to: 'comments#create'
  delete '/comments/:id', to: 'comments#destroy'
  post '/blogs/reaction/:blog_id', to: 'blogs#reaction'
  put '/blogs/reaction/:reaction_id', to: 'blogs#reaction_update'
  delete '/blogs/reaction/:reaction_id', to: 'blogs#reaction_delete'
  get '/signin', to: 'sessions#new', as: :new_sessions
  post '/signin', to: 'sessions#create', as: :sessions
  post '/updates/new', to: 'home#update_new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
