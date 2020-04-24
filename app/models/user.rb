class User < ApplicationRecord
  has_many :messages
  has_many :artist_users
  has_many :artists, through: :artist_users
end
