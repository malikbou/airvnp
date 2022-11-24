class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :capacity, :image_url, :description, :category, :pricing, presence: true
  validates :capacity, numericality: { only_integer: true }

  validates :pricing, numericality: true

  include PgSearch::Model
  pg_search_scope :search_by_name_address_description_category,
                  against: %I[name address description category],
                  using: {
                    tsearch: { prefix: true }
                  }
  # multisearchable against: [:name, :address, :capacity]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
