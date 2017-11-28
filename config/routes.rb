Rails.application.routes.draw do
  devise_for :users
  root to: 'plots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots
  resources :bookings
  resources :users, only: [:show]
end
