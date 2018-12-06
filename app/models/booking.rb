class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :vehicle
  has_one :review
  validates :start_date, presence: true
  validate :check_availability, on: :create
  validates :end_date, presence: true
  validates :profile_id, presence: true
  validates :vehicle_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
  scope :accepted, -> { where(status: 'Accepted') }

  def check_availability
    errors.add(:end_date, "can't be before the Start date") if end_date < start_date

    self.vehicle.booking_periods.each do |period|
      errors.add(:start_date, "can't be in a period where the vehicle is already booked") if period.include? start_date
      errors.add(:end_date, "can't be in a period where the vehicle is already booked") if period.include? end_date
      errors.add(:start_date, "can't overlap a period where the vehicle is already booked") if (start_date..end_date).include?(period)
    end
  end
end
