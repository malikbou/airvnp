class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def show
    @booking = Booking.new
    @venue = Venue.find(params[:id])
  end

  # private

  # def set_venue
  #   @venue = Venue.find(params[:id])
  # end

end
