Rails.application.routes.draw do
  root to: "reviews#index"

  resources :reviews do
    resources :comments
  end
end
