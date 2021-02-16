Rails.application.routes.draw do
  resources :users
  resources :cars, only: [:index, :create, :show]
  resources :pictures, only: [:create]
  resources :appointments, only: [:index, :create, :destroy]
  post '/login', to: "auth#login"
  delete '/logout', to: "auth#destroy"
end
