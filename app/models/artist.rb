class Artist < ApplicationRecord
  has_many :artist_users
  has_many :users, through: :artist_users
end
