class User < ApplicationRecord
  has_many :bookings
  validates :name, :email, presence: true
end
