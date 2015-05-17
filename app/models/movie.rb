class Movie < ActiveRecord::Base
  validates :title, presence: true

  serialize :genres, Array
end
