Rails.application.routes.draw do
  resources :author_publishers
  resources :users, only: [:index]
  resources :authors, only: [:index, :show]
  resources :publishers, only: [:show]
  resources :books do
  # resources :authors, only: [:show]
  resources :reviews
  get '/author', to: 'authors#book_author'
  end

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post '/login', to: "sessions#show"
  delete '/logout', to: 'sessions#destroy'
  post '/password/reset', to: 'users#reset'
  get '/users/:id', to: 'users#user'
  # get '/search', to: 'books#search'

end

