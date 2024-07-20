cities = [
  { id: 1, name: 'Cairo' },
  { id: 2, name: 'Giza' },
  { id: 3, name: 'AlFayyum' },
  { id: 4, name: 'AlMinya' },
  { id: 5, name: 'Asyut' }
]

cities.each do |city_data|
  City.create!(city_data) unless City.exists?(city_data[:id])
end


trips = [
  { id: 1, start_city_id: 1, end_city_id: 3 },
  { id: 2, start_city_id: 1, end_city_id: 4 },
  { id: 3, start_city_id: 1, end_city_id: 5 },
  { id: 4, start_city_id: 3, end_city_id: 4 },
  { id: 5, start_city_id: 3, end_city_id: 5 },
  { id: 6, start_city_id: 4, end_city_id: 5 }
]

trips.each do |trip_data|
  Trip.create!(trip_data) unless Trip.exists?(trip_data[:id])
end


buses = [
  { id: 1, trip_id: 1 },
  { id: 2, trip_id: 2 },
  { id: 3, trip_id: 3 },
  { id: 4, trip_id: 4 },
  { id: 5, trip_id: 5 },
  { id: 6, trip_id: 6 }
]

buses.each do |bus_data|
  Bus.create!(bus_data) unless Bus.exists?(bus_data[:id])
end


(1..6).each do |bus_id|
  (1..12).each do |seat_number|
    Seat.create!(bus_id: bus_id, seat_number: seat_number) unless Seat.exists?(bus_id: bus_id, seat_number: seat_number)
  end
end

puts "Seeding completed!"

