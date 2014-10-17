require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resources :galleries do
    resources :images, except: [:index]
  end

  resources :tags, only: [:show]

  resources :images, only: [] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
  end

  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    member do
      post "/join" => "group_memberships#create"
      delete "/leave" => "group_memberships#destroy"
    end
  end
end
