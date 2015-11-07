Rails.application.routes.draw do
  root to: "reviews#index"

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'

  resources :reviews do
    resources :comments
  end

  resources :users

  resources :sessions, only: [:new, :create, :destroy]
end
