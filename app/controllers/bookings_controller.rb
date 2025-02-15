class BookingsController < ApplicationController

  before_action :authenticate_user!
  def index
    render json: Booking.all
  end

  def create
    trip = Trip.find(params[:trip_id])

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
    booking = current_user.bookings.new(seat: seat, trip: trip)
    
    if booking.save
      render json: { status: 'Booking successful' }, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: [e.message] }, status: :not_found
  end
  

  def destroy
    booking = Booking.find(params[:id])
    if booking.destroy
      render json: { message: 'Booking deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete booking' }, status: :unprocessable_entity
    end
  end
  
end


