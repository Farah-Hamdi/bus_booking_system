class SeatsController < ApplicationController
  def index
    # Ensure that both parameters are present
    if params[:start_city_id].blank? || params[:end_city_id].blank?
      return render json: { error: 'Missing parameters: start_city_id and end_city_id are required' }, status: :bad_request
    end

    # Find the trip based on the start and end city IDs
    trip = Trip.find_by(start_city_id: params[:start_city_id], end_city_id: params[:end_city_id])
    
    if trip
      # Find available seats that are not booked
      available_seats = trip.bus.seats.left_joins(:bookings).where(bookings: { id: nil })
      render json: available_seats
    else
      render json: { error: 'Trip not found' }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
  
end
