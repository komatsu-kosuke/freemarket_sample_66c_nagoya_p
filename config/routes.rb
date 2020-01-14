Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#index'

  resources :signup, only: [:index] do
    collection do
      get 'registration'
    end
  end

  resources :homes, only: [:index, :show]
    get "profile" => "homes#profile"
  resources :trading, only: [:new, :create, :edit, :update]
end



# colectionとnumber調べること