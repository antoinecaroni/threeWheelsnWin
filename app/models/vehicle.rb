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
end
