Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots do
    resources :bookings
  end
  resources :users, only: [:show]
  resources :reviews, only: :create
end
