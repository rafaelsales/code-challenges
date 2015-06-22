class Movie < ActiveRecord::Base
  validates :title, :year, presence: true
  has_many :ratings

  def average_rating
    ratings.average(:stars)
  end

  def rate(user:, stars:)
    ratings.find_or_initialize_by(user: user).tap do |rating|
      rating.update(stars: stars)
    end
  end

  def unrate(user)
    ratings.where(user_id: user).destroy_all
  end
end
