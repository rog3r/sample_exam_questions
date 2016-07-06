Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :surveys, only: [:index] do
    resources :attempts, except: [:edit, :update, :destroy]

  end

  namespace :admin do
    resources :surveys do
      resources :attempts
    end
    get '/' , to: 'surveys#index'
  end

  root 'surveys#index'
end
