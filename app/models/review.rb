class Review < ApplicationRecord
  belongs_to :booking
  validates :content, presence: true
  validates :booking_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: (0..5) }
end