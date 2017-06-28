Rails.application.routes.draw do
  get 'home_listings/index'

  get 'home_listings/show'

  get 'home_listings/edit'

  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/help'

  get 'welcome/host'

  devise_for :users
  
  root 'welcome#index'
end
