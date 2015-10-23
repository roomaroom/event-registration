Rails.application.routes.draw do
  resources :appointments do
    collection do
      get 'search'
    end
  end
  
  resources :events
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Upmin::Engine => '/admin1'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
