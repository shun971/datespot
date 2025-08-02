Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

  resources :users, only: [:show] 
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :perfumes

  root 'tweets#index'
end
