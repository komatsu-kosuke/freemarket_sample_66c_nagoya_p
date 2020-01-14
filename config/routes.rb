Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#index'

  resources :signup, only: [:index] 
    # collection do
    #   get 'registration'
    # end
  # end

  resources :homes, only: [:index, :show]
  resources :trading, only: [:new, :create, :edit, :update]
end



# colectionとnumber調べること