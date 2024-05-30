Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }

  resources :posts

  post "/profile/:id/follow", to: 'profile#follow', as: 'follow'
  post "/profile/:id/accept", to: 'profile#accept', as: 'accept'
  post "/profile/:id/decline", to: 'profile#decline', as: 'decline'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end


