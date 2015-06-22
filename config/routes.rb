Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]
  resources :movies, only: [:index] do
    resource :rating, only: [:create, :destroy]
  end
end
