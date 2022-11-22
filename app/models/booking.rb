class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :end_date, comparison: { greater_than: :start_date }
  # missing date validations for start and end date - dependant on simple form entry
end
