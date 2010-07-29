Refinery::Plugin.register do |plugin|
  plugin.title = "Map"
  plugin.description = "Provides a Google map with location markers"
  plugin.version = 1.0
  plugin.menu_match = /(admin|refinery)\/map(_locations)?$/
  plugin.url = '/refinery/map'
  plugin.activity = {
    :class => MapLocation,
    :title => 'title',
    :url_prefix => 'edit'
  }
  plugin.directory = directory
end
