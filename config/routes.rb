Rails.application.routes.draw do
  # devise_for :users
  resources :bookings, only: [:index, :create, :destroy]
  resources :cities, only: [:index]
  resources :seats, only: [:index]
  resources :buses, only: [:index]
  resources :trips, only: [:index]
  resources :users, only: [:destroy, :index]
  # resources :users, only: [:create]
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get "up" => "rails/health#show", as: :rails_health_check

  
end
