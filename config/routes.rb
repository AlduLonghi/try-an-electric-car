Rails.application.routes.draw do
  root :to => "users#show"
  resources :users, only: [:create, :show]
  resources :cars, only: [:index, :create, :show], defaults: {format: :json}
  resources :pictures, only: [:create, :destroy]
  resources :appointments, only: [:index, :create, :destroy], defaults: {format: :json}
  post '/login', to: "auth#login"
  delete '/logout', to: "auth#destroy"
end
