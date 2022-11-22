class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :name, :address, presence: true
end
