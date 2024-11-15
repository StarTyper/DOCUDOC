Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, skip: :registrations
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "home", to: "pages#home", as: :home
  get "denied", to: "pages#denied", as: :access_denied

  resources :clients, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :projects, only: [:index, :new]
  end
  resources :users, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :documentations
end
