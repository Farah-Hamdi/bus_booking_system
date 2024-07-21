Rails.application.routes.draw do
  resources :bookings, only: [:index, :create]
  resources :cities, only: [:index]
  resources :seats, only: [:index]
  resources :buses, only: [:index]
  resources :trips, only: [:index]
  resources :users, only: [:create]

  get "up" => "rails/health#show", as: :rails_health_check

  
end
