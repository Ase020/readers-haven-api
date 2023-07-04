Rails.application.routes.draw do
  resources :author_publishers
  resources :authors
  resources :publishers
  resources :users, only: [:index]
  resources :books do
  resources :reviews
  end
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post '/login', to: "sessions#show"
  delete 'logout', to: 'sessions#destroy'

end
