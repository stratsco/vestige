Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
  end

  devise_for :users
  root "guilds#index"

  resources :guilds
end
