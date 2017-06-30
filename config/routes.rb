Rails.application.routes.draw do
  devise_for :users
  
  resources :home_listings
  
  root 'home_listings#index'
end
