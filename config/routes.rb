Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/help'

  get 'welcome/host'

  devise_for :users
  
  root 'welcome#index'
end
