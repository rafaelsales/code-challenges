class Rating < ActiveRecord::Base
  belongs_to :movie
  validates :stars, presence: true, inclusion: { in: 1..5 }
end
