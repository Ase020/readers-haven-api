Rails.application.routes.draw do
  resources :author_publishers
  resources :authors
  resources :publishers
  resources :reviews
  resources :users
  resources :books

end
