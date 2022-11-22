class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_many :users
  has_many :venues
end
