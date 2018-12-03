class Profile < ApplicationRecord
  belongs_to :user
  has_many :vehicles
  has_many :bookings
end
