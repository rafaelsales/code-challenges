class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_movie

  def create
    rating = @movie.rate(user: current_user, stars: params[:stars])

    if rating.errors.none?
      render nothing: true, status: :created
    else
      render json: { errors: rating.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.unrate(current_user)
    render nothing: true, status: :no_content
  end

  private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
