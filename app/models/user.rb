class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :tweets
end
