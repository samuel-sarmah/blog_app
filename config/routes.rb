Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/update"
  resource :session
  resources :passwords, param: :token
  resource :sign_up

  root "articles#index"

  resources :articles do
    resources :comments
  end

  namespace :settings do
    resource :email, only: [ :show, :update ]
    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update ]
    resource :user, only: [ :show, :destroy ]

    root to: redirect("/settings/profile")
  end

  namespace :email do
    resources :confirmations, param: :token, only: [ :show ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
