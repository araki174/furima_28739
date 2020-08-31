Rails.application.routes.draw do
  get 'users/index'
  root to: "users#index"
  resources :users, only: [:edit, :update]
  devise_for :users
end
