Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]
  resources :movies, only: [:index]
end
