Rails.application.routes.draw do
  resources :users
  resources :cars, only: [:create, :show]
  resources :pictures, only: [:create]
  resources :appointments, only: [:create]
  post '/login', to: "auth#login"
  delete '/logout', to: "auth#destroy"
end
