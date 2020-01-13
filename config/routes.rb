Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'

  resources :homes, only: [:index, :show]
  resources :trading, only: [:new, :create, :edit, :update]
end
