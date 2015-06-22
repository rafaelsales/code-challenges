class Movie < ActiveRecord::Base
  validates :title, :year, presence: true
  has_many :ratings

  def average_rating
    ratings.average(:stars)
  end
end
