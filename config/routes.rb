Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "places#index"
  resources :places, only: [:show, :edit, :update, :new, :create, :destroy]
end
