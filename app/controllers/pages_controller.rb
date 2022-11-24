class PagesController < ApplicationController
  def home
    @venues = Venue.first(6)
  end
end
