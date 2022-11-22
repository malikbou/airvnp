class Venue < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, :address, :capacity, presence: true
  validates :name, :address, uniqueness: { case_sensitive: false }
  validates :capacity, numericality: { only_integer: true }
end
