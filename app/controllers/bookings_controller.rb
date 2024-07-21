class BookingsController < ApplicationController
  def index
    render json: Booking.all
  end

  def create
    # Find the trip by trip_id
    trip = Trip.find(params[:trip_id])

    # Find the seat by seat number and bus
    seat = trip.bus.seats.find_by(seat_number: params[:seat_number])

    # Check if the seat exists and is part of the trip's bus
    if seat.nil?
      return render json: { errors: ['Seat not found for this trip'] }, status: :not_found
    end

    # Check if the seat is already booked for this trip
    if seat.bookings.where(trip_id: trip.id).exists?
      return render json: { errors: ['Seat is already booked for this trip'] }, status: :unprocessable_entity
    end

    # Create the booking
    booking = Booking.new(user_id: params[:user_id], seat: seat, trip: trip)

    if booking.save
      render json: { status: 'Booking successful' }, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: [e.message] }, status: :not_found
  end
  
end


