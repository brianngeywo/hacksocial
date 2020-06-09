Rails.application.routes.draw do
  root to: "pages#home"

  resources :phones
  resources :shops
  get "signup", to: "shops#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
