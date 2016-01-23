Rails.application.routes.draw do
  devise_for :users
  root "guilds#index"

  resources :guilds
end
