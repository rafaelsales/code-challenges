class User < ActiveRecord::Base
  ROLES = ['admin', 'user']
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  validates :email, presence: true
  validates :role, inclusion: { in: ROLES }
end
