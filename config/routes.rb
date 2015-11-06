Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/help'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'events#index', as: :authenticated_root
    end

    unauthenticated do
      root to: "visitors#index", as: :unauthenticated_root
    end
  end

  resources :appointments do
    collection do
      get 'search'
    end
  end
  
  resources :events 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Upmin::Engine => '/admin1'
  #root to: 'visitors#index'

  resources :users do
    collection do
      get 'clear_amount'
    end
  end
end
