Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  root "galleries#index"

  resources :galleries do
    resources :images, except: [:index]
  end
end