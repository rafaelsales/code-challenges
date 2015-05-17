class API::V1::MoviesController < API::V1::BaseController
  before_action :find_movie, only: [:show, :update, :destroy]

  def index
    movies = Movie.all
    respond_with movies
  end

  def show
    respond_with @movie
  end

  def create
    movie = Movie.create(movie_params)

    if movie.valid?
      respond_with movie, location: api_v1_movie_path(movie.id)
    else
      respond_with movie
    end
  end

  def update
    @movie.update(movie_params)
    respond_with @movie
  end

  def destroy
    @movie.destroy
    respond_with @movie
  end

  private

  def find_movie
    @movie = Movie.where(id: params[:id]).first
  end

  def movie_params
    params.require(:movie).permit(:title, :year, genres: [])
  end
end
