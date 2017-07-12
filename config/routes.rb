Rails.application.routes.draw do
  devise_for :users
  
  resources :home_listings do
    resources :booking_requests
  end

  resources :build
  resources :lessor
  resources :charges, only: [:new, :create]
  
  get 'booking_requests/confirmed', to: 'booking_requests#confirmed'
  
  root 'home_listings#index'
end
