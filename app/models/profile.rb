class Profile < ApplicationRecord
  belongs_to :user
  has_many :vehicles
  has_many :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address_street, presence: true
  validates :address_city, presence: true
  validates :address_zipcode, presence: true
  validates :user_id, presence: true
  mount_uploader :photo, PhotoUploader
end
