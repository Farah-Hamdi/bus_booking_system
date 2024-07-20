class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :seat
  belongs_to :trip
  
  validates :seat_id, uniqueness: { scope: :trip_id }
end
