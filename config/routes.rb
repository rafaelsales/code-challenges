TweekTv::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, defaults: {:format => :json}, only: [:show, :create, :update, :destroy] do
        post 'like_movie/:movie_id', action: :like_movie, as: :movie_like
        delete 'like_movie/:movie_id', action: :unlike_movie
      end

      resources :movies, defaults: {:format => :json}, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
