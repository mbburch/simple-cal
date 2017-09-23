Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get '/dashboard', to: 'events#index'
  resources :events
  resources :categories
end
