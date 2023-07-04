Rails.application.routes.draw do
  resources :author_publishers
  resources :authors
  resources :publishers
  resources :users
  resources :books do
  resources :reviews
  end

end
