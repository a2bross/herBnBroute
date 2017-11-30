Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end
  # patch 'bookings/:id/accept', to: "bookings#accept"
  resources :users, only: [:show]
  resources :reviews, only: :create
end
