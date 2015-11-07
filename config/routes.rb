Rails.application.routes.draw do
  root to: "reviews#index"

  get '/signin', to: 'users#new'

  resources :reviews do
    resources :comments
  end

  resources :users
end
