class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :profile
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :type_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :profile_id, presence: true
  validates :seats, numericality: { only_integer: true }
  validates :address_street, presence: true
  validates :address_city, presence: true
  validates :address_zipcode, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :change_to_address?

  def address
    [address_street, address_city, address_zipcode].join(', ')
  end

  def booking_periods
    self.bookings.accepted.map do |booking|
      booking.start_date..booking.end_date
    end
  end

  private

  def change_to_address?
    will_save_change_to_address_city? || will_save_change_to_address_zipcode? || will_save_change_to_address_street?
  end
end
