Rails.application.routes.draw do
  resources :author_publishers
  resources :authors
  resources :publishers
  resources :users
  resources :books do
  resources :reviews, only: [:index, :create]
  resources :reviews, only: [:show, :update, :destroy], param: :review_id
  resources :profile, only: [:index, :show] do
  end

end
