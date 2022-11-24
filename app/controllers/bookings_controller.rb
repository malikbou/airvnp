class BookingsController < ApplicationController
  def all
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      redirect_to booking_confirmation_path(@booking)
    else
      render template: "venues/show", status: :unprocessable_entity
    end
  end

  def booking_confirmation
    @booking = Booking.find(params[:id])
    @markers = {
      lat: @booking.venue.latitude,
      lng: @booking.venue.longitude,
      info_window: render_to_string(partial: "info_window", locals: {venue: @booking.venue}),
      image_url: helpers.asset_url("pin.png")
    }
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
