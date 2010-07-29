class MapLocationsController < ApplicationController

  before_filter :find_locations, :find_page
  before_filter :find_location, :only => [:show]

protected

  def find_locations
    if params[:q]
      coords = Geocode.find_address(params[:q])
      @map_locations = MapLocation.nearest_to(coords.latitude, coords.longitude, 50)
    else
      @map_locations = MapLocation.all
    end
  end

  def find_location
    @map_location = MapLocation.find(params[:id])
  end

  def find_page
    @page = Page.find_by_link_url("/map")
  end

end
