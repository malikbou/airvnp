class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

end
