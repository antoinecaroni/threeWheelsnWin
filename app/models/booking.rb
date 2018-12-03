class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :vehicle
  has_one :review
end
