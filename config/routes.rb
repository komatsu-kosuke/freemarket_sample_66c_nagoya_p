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
    member do
      get "profile"
      get "credit"
      get "logout" 
    end
  end

  resources :accounts, only: [:index, :edit, :update] do
    collection do
      get "listing"
      get "listing_progress"
      get "completed"
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :trading, only: [:new, :create, :edit, :update]

  resources :products, only: [:show] do
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
  end
end



# colectionとmember調べること