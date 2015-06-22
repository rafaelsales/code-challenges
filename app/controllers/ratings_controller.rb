class RatingsController < ApplicationController
  def index
    render json: Movie.all
  end
end
