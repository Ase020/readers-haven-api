Rails.application.routes.draw do
  resources :author_publishers
  resources :users, only: [:index]
  resources :authors
  resources :publishers, only: [:show]
  resources :books do
  resources :reviews
  end
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post '/login', to: "sessions#show"
  delete '/logout', to: 'sessions#destroy'
  post '/password/reset', to: 'users#reset'

end
