class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :vehicle
  has_one :review
  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date }
  validates :profile_id, presence: true
  validates :vehicle_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
