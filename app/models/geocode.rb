HTTP_ERRORS = [ Timeout::Error,
                Errno::EINVAL,
                Errno::ECONNRESET,
                EOFError,
                Net::HTTPBadResponse,
                Net::HTTPHeaderSyntaxError,
                Net::ProtocolError          ]     unless defined?(HTTP_ERRORS)

module Geocode
  
  Coordinate = Struct.new(:latitude, :longitude)
  
  class Response
    
    def initialize(http_response)
      require 'json/pure' unless defined?(JSON::JSON_LOADED)
      @response = http_response
    end
    
    def data
      @data ||= JSON.parse(@response.body)
    end
    
    def coordinate
      @coordinate ||= begin
        coordinate = data['results'][0]['geometry']['location']
        Geocode::Coordinate.new(coordinate['lat'], coordinate['lng'])
      end
    end
    
    def success?
      @response.kind_of?(Net::HTTPSuccess) && data['status'] == 'OK'
    rescue
      false
    end
    
  end
  
  
  def self.find_address(address)
    query_for_coordinates(address) || default_coordinate
  end
  
  
  private
  
  
  def self.query_for_coordinates(address)
    response = request(address)
    response.coordinate if response.success?
  rescue *HTTP_ERRORS
  end
  
  def self.default_coordinate
    Coordinate.new(0,0)
  end
  
  def self.request(address)
    require 'net/http'
    require 'cgi'
    require 'uri'
    
    uri = URI.parse("http://maps.google.com/maps/api/geocode/json?address=#{CGI.escape(address)}&sensor=false")
    Net::HTTP.start(uri.host, uri.port) do |http|
      Geocode::Response.new(http.get("#{uri.path}?#{uri.query}"))
    end
  end
  
end

