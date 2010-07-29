class MapLocation < ActiveRecord::Base

  validates_presence_of :title, :address, :city, :state, :zipcode

  has_friendly_id :title, :use_slug => true

  acts_as_indexed :fields => [:title, :address, :city, :state, :zipcode]

  default_scope :order => "state, city, title"

  before_save :set_lat_and_lng

  # for will_paginate
  def self.per_page
    20
  end

  ##
  # Returns a scope which queries for the nearest locations to the requested
  # coordinates (latitude and longitude in decimal format).
  # 
  # This method uses a variation of the Haversine Formula.  Conversions have
  # already been made to radians and the Earth's radius (3956mi) has already
  # been baked in.  The variation arises where the distance is not calculated
  # against every instance in the database, instead a rough box is drawn 
  # around the source point that encapsulates the desired radius.  Only those
  # objects within the box are calculated for distance. 
  # 
  def self.nearest_to(latitude, longitude, radius = 100)
    latitude_delta  = radius.to_f / 69.0
    longitude_delta = radius.to_f / (Math.cos(latitude) * 69.0).abs
    scoped({
      :select     => "*, 7912 * ASIN(SQRT(POWER(SIN((#{latitude} - lat) * 0.00872664626), 2) + COS(#{latitude} * 0.0174532925) * COS(#{latitude} * 0.0174532925) * POWER(SIN((#{longitude} - lng) * 0.00872664626), 2))) as distance_from_source",
      :order      => 'distance_from_source ASC',
      :conditions => "lat BETWEEN #{latitude - latitude_delta} AND #{latitude + latitude_delta} AND lng BETWEEN #{longitude - longitude_delta} AND #{longitude + longitude_delta}"
    })
  end

  def full_address
    "%s, %s, %s %s" % [self.address, self.city, self.state, self.zipcode]
  end


  private


  def set_lat_and_lng
    if address_changed? || city_changed? || state_changed? || zipcode_changed?
      Geocode.find_address(self.full_address).tap do |coordinate|
        self.lat = coordinate.latitude
        self.lng = coordinate.longitude
      end
    end
  end

  def lat=(input); write_attribute(:lat, input); end
  def lng=(input); write_attribute(:lng, input); end

end
