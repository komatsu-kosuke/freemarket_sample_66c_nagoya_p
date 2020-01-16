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

  resources :homes, only: [:index, :show]
    get "profile" => "homes#profile"
  resources :trading, only: [:new, :create, :edit, :update]
end



# colectionとnumber調べること