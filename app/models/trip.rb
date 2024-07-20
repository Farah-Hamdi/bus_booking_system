class Trip < ApplicationRecord
  belongs_to :start_city, class_name: 'City'
  belongs_to :end_city, class_name: 'City'
  has_one :bus
  has_many :seats, through: :bus
end
