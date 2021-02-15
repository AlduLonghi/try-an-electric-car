Rails.application.routes.draw do
  resources :users
  resources :cars, only: [:create, :show]
  resources :pictures, only: [:create]
  post '/login', to: "auth#login"
  delete '/logout', to: "auth#logout"
end
