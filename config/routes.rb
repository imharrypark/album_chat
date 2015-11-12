Rails.application.routes.draw do
  root to: "reviews#index"

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/search/1', to: 'queries#search_artist'
  get '/search/2', to: 'queries#search_album'

  resources :reviews do
    resources :comments
  end

  resources :users

  resources :sessions, only: [:new, :create, :destroy]
end
