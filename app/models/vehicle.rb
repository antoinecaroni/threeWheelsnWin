class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :profile
end
