Gem::Specification.new do |s|
  s.name              = %q{refinerycms-map}
  s.version           = %q{0.1.0}
  s.description       = %q{A RefineryCMS plugin that displays an interactive Google map with flaggable locations.}
  s.date              = %q{2010-07-29}
  s.summary           = %q{Ruby on Rails map engine for RefineryCMS.}
  s.email             = %q{lab@envylabs.com}
  s.homepage          = %q{http://github.com/envylabs/refinerycms-map}
  s.authors           = %w(Envy\ Labs)
  s.require_paths     = %w(lib)

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/map_locations_controller.rb',
    'app/controllers/map_locations_controller.rb',
    'app/models',
    'app/models/geocode.rb',
    'app/models/map_location.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/map_locations',
    'app/views/admin/map_locations/_form.html.erb',
    'app/views/admin/map_locations/_map_location.html.erb',
    'app/views/admin/map_locations/edit.html.erb',
    'app/views/admin/map_locations/index.html.erb',
    'app/views/admin/map_locations/new.html.erb',
    'app/views/map_locations',
    'app/views/map_locations/_locations.html.erb',
    'app/views/map_locations/_map.html.erb',
    'app/views/map_locations/_search.html.erb',
    'app/views/map_locations/index.html.erb',
    'app/views/map_locations/show.html.erb',
    'config',
    'config/locales',
    'config/locales/en.yml',
    'config/routes.rb',
    'generators',
    'generators/map',
    'generators/map/map_generator.rb',
    'generators/map/templates',
    'generators/map/templates/jquery.jmapping.min.js',
    'generators/map/templates/jquery.metadata.js',
    'generators/map/templates/mapiconmaker.js',
    'generators/map/templates/markermanager.js',
    'generators/map/templates/migration.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/map.rb',
    'license.md',
    'rails',
    'rails/init.rb',
    'readme.md',
    'test',
    'test/unit',
    'test/unit/map_location_test.rb'
  ]
  s.test_files        = [
    'test/unit/map_location_test.rb'
  ]
end
