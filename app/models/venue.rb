class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :capacity, :image_url, presence: true
  validates :capacity, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
