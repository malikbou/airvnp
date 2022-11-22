class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    @booking.save
    redirect_to my_booking_path
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def all
    @bookings = Booking.all
  end

end
