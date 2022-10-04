Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "places#index"  # Defines the root path route ("/")

  devise_for :users
  resources :places
end
