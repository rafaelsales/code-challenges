class Rating < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :user, presence: true
  validates :stars, presence: true, inclusion: { in: 1..5 }
end
