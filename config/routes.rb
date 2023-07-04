Rails.application.routes.draw do
  resources :author_publishers
  resources :authors
  resources :publishers
  resources :reviews
  resources :users
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
