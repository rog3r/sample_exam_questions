Rails.application.routes.draw do
  resources :surveys do
    resources :attempts
  end
  root 'surveys#index'
end
