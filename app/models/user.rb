class User < ActiveRecord::Base
  ROLES = ['admin', 'user']
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :ratings

  validates :email, presence: true
  validates :role, inclusion: { in: ROLES }
end
