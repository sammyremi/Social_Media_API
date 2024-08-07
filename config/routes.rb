Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }


  namespace :api do
    namespace :v1 do
      get "profile/:id", to: "profile#show"

      get "feeds", to: "feeds#index"
    
      post "/profile/:id/follow", to: 'profile#follow', as: 'follow'
      post "/profile/:id/accept", to: 'profile#accept', as: 'accept'
      post "/profile/:id/decline", to: 'profile#decline', as: 'decline'
      post "/profile/:id/unfollow", to: 'profile#unfollow', as: 'unfollow'
      post "/profile/:id/remove_request", to: 'profile#remove_request', as: 'remove_request'
      
      resources :posts do
        resources :comments do
          resources :likes, only: [:create, :destroy]
        end
        resources :likes, only: [:create, :destroy]
      end
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end


