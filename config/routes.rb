Rails.application.routes.draw do
  resources :author_publishers
  resources :users, only: [:index]
  resources :authors, only: [:index, :show]
  resources :publishers, only: [:show]
  resources :books do
  # resources :authors, only: [:show]
  resources :reviews
  end
  post "/signup", to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  post '/password/reset', to: 'users#reset'
  get "/me", to: "users#show"
  # post '/login', to: "sessions#show"
  # get '/search', to: 'books#search'

end
