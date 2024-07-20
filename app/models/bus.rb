class Bus < ApplicationRecord
  belongs_to :trip
  has_many :seats
end
