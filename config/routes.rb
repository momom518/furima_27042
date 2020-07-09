Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :edit, :show, :create, :destroy]
  resources :purchase, only: [:new, :create]

  end
