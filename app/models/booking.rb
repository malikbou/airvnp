class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_many :users
  has_many :venues
  has_many :reviews, dependent: :destroy
  validates :end_date, comparison: { greater_than: :start_date }
  # missing date validations for start and end date - dependant on simple form entry
end
