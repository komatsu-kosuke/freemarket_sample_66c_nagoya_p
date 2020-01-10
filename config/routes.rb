Rails.application.routes.draw do
  devise_for :reviews
  devise_for :tradings
  devise_for :orders
  devise_for :comments
  devise_for :likes
  devise_for :categories
  devise_for :sizes
  devise_for :brands
  devise_for :product_images
  devise_for :creditcards
  devise_for :shippings
  devise_for :products
  devise_for :addresses
  devise_for :profiles
  devise_for :users
  root to: 'homes#index'

  resources :homes, only: [:index, :show]
end
