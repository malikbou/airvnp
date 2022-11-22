class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def show
    @venue = Venue.find(params[:id])
  end

end
