Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:new, :create]
  end
end
