Rails.application.routes.draw do
  root "guilds#index"

  resources :guilds
end
