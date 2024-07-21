class User < ApplicationRecord
  has_many :bookings
  validates :name, :email, :password, presence: true
end
