class Venue < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :bookings

  validates :name, :address, :capacity, presence: true
  validates :name, :address, uniqueness: { case_sensitive: false }
end
