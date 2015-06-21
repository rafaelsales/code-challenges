class Movie < ActiveRecord::Base
  validates :title, :year, presence: true
end
