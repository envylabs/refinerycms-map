ActionController::Routing::Routes.draw do |map|
  map.resources :map_locations, :as => :map

  map.namespace(:admin, :path_prefix => (defined?(REFINERY_GEM_VERSION) ? 'admin' : 'refinery')) do |admin|
    admin.resources :map_locations, :as => :map
  end
end
