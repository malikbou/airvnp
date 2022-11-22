class Review < ApplicationRecord
  belongs_to :booking

  # validates :rating, uniqueness: true, presence: true
end
