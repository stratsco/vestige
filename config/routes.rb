Rails.application.routes.draw do
  namespace :admin do
    root "application#index"

    resources :guilds, only: [:new, :create, :destroy]
  end

  devise_for :users
  root "guilds#index"

  resources :guilds, only: [:index, :show, :edit, :update]
end
