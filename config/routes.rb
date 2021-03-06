Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/about'
  get 'static_pages/help'

  devise_scope :user do
    authenticated :user do
      root to: 'events#index', as: :authenticated_root
    end

    unauthenticated do
      root to: "events#index", as: :unauthenticated_root
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
  #mount Upmin::Engine => '/admin1'
  #root to: 'visitors#index'

  resources :users do
    collection do
      get 'clear_amount'
    end
  end

  concern   :user_comments,  TheComments::UserRoutes.new
  concern   :admin_comments, TheComments::AdminRoutes.new
  resources :comments, concerns:  [:user_comments, :admin_comments]
end
