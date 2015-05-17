class API::V1::UsersController < API::V1::BaseController
  before_action :find_user, only: [:show, :update, :destroy]

  def show
    render json: @user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      respond_with user, location: api_v1_user_path(user.id)
    else
      respond_with user
    end
  end

  def update
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  def like_movie
    user = User.find(params[:user_id])
    movie_id = params[:movie_id]
    if user.like_movie! movie_id
      head status: :created, location: api_v1_user_movie_like_path(user.id, movie_id)
    else
      head status: :unprocessable_entity
    end
  end

  def unlike_movie
    user = User.find(params[:user_id])
    user.unlike_movie! params[:movie_id]
    head status: :no_content
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
