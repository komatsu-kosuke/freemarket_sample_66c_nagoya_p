Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#index'

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'sms'
      get 'adress'
    end
  end

  resources :homes, only: [:index, :show, :edit, :update] do
    collection do
      get "logout" 
      get "credit"
      get "credit_register"
    end
    member do
      get "profile"
    end
  end

  resources :accounts, only: [:index, :edit, :update] do
    collection do
      get "listing"
      get "listing_progress"
      get "completed"
    end
  end
  
  resources :trading, only: [:new, :create, :edit, :update]
  resources :products, only: [:show] do
    member do
      get "buy"
    end
  end
end



# colectionとmember調べること