Rails.application.routes.draw do
  devise_for :users
  root to: 'plots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots, only: [:new, :create, :index, :show]
  resources :users, only: [:show]
end
