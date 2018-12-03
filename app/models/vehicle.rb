class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :profile
  has_many :bookings
  has_many :reviews, through: :bookings
end
