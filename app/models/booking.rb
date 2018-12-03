class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :vehicle
  has_one :review
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :profile_id, presence: true
  validates :vehicle_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
