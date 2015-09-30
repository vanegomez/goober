Rails.application.routes.draw do
  root 'welcome#index'

  resources :riders, only: [:new, :create, :show]
  resources :drivers, only: [:new, :create, :show]
  resources :rides, only: [:new, :create, :update]

  get    '/rider_login',  to: 'rider_sessions#new'
  post   '/rider_login',  to: 'rider_sessions#create'
  delete '/rider_logout', to: 'rider_sessions#destroy'

  get    '/driver_login',  to: 'driver_sessions#new'
  post   '/driver_login',  to: 'driver_sessions#create'
  delete '/driver_logout', to: 'driver_sessions#destroy'

  namespace :admin do
    resources :rushes, only: [:index, :new, :create, :delete]
  end
end
