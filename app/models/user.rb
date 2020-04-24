class User < ApplicationRecord
  has_many :messages
  has_many :artist_users
  has_many :artists, through: :artist_users

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
