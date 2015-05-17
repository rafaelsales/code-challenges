class User < ActiveRecord::Base
  validates :email, presence: true, :uniqueness => true

  has_many :movie_likes

  def like_movie! movie_id
    return nil if movie_likes.exists?(movie_id: movie_id)
    movie_likes.create movie_id: movie_id
  end

  def unlike_movie! movie_id
    movie_likes.find_by!(movie_id: movie_id).destroy
  end
end
