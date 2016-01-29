Rails.application.routes.draw do
  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
    root "application#index"

    resources :guilds, only: [:new, :create, :destroy]
    resources :users
  end

  devise_for :users
  root "guilds#index"

  resources :guilds, only: [:index, :show, :edit, :update]
end
