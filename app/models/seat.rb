class Seat < ApplicationRecord
  belongs_to :bus
  has_many :bookings
  validates :seat_number, presence: true, uniqueness: { scope: :bus }
end
