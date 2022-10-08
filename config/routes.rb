Rails.application.routes.draw do
  devise_for :users
  root to: 'places#index'

  resources :places do
    resources :bookings, only: %i[new create update destroy]
  end

  resources :users, only: [:show] do
    resources :bookings, only: %i[index show update destroy]
  end
end
