class Artist < ApplicationRecord
  has_many :artist_users
  has_many :users, through: :artist_users

  has_many :images
  has_many :messages
  has_many :media_links
  has_many :music_links
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
