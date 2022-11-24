class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @venues = Venue.search_by_name_address_description_category(params[:query])
    else
      @venues = Venue.all
    end
  end

  def new
    @venue = Venue.new
  end

  def show
    @booking = Booking.new
    @venue = Venue.find(params[:id])
    @markers = {
          lat: @venue.latitude,
          lng: @venue.longitude,
          info_window: render_to_string(partial: "info_window", locals: {venue: @venue}),
          image_url: helpers.asset_url("pin.png")
        }
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_path, status: :see_other
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity, :image_url, booked: false)
  end
end
