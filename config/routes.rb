Rails.application.routes.draw do
  # get 'items/index'
  get 'items/new'
  root to: "items#index"
  resources :users, only: [:edit, :update]
  devise_for :users
end
