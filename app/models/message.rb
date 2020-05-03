class Message < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  validates :user_id, presence: true
  validates :artist_id, presence: true
  validates :text, presence: true
  validates :recipient_id, presence: true
end
