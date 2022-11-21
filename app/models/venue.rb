class Venue < ApplicationRecord
  belongs_to :user

  validates :name, :address, :capacity, presence: true
end
