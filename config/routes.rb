Rails.application.routes.draw do
  resources :films, only: :index
  resources :purchases, only: [:index, :create]
end
