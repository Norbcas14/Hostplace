Rails.application.routes.draw do
  devise_for :users

  root to: "places#index"
  resources :places, only: [:show, :edit, :update, :new, :create, :destroy] do
    resources :bookings
  end

  resources :places
end
