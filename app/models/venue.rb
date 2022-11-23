class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :capacity, :image_url, presence: true
  validates :capacity, numericality: { only_integer: true }
end
