class Admin::MapLocationsController < Admin::BaseController

  crudify :map_location, :order => "state, city"

end
