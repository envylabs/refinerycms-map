Gem::Specification.new do |s|
  s.name              = %q{refinerycms-map}
  s.version           = %q{0.2.0}
  s.description       = %q{A RefineryCMS plugin that displays an interactive Google map with flaggable locations.}
  s.date              = %q{2010-12-06}
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
    'lib',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_map',
    'lib/generators/refinerycms_map/templates',
    'lib/generators/refinerycms_map/templates/db',
    'lib/generators/refinerycms_map/templates/db/migrate',
    'lib/generators/refinerycms_map/templates/db/migrate/migration_number_create_singuar_name.rb',
    'lib/generators/refinerycms_map/templates/db/seeds',
    'lib/generators/refinerycms_map/templates/db/seeds/seed.rb',
    'lib/generators/refinerycms_map/templates/js',
    'lib/generators/refinerycms_map/templates/js/jquery.jmapping.min.js',
    'lib/generators/refinerycms_map/templates/js/jquery.metadata.js',
    'lib/generators/refinerycms_map/templates/js/mapiconmaker.js',
    'lib/generators/refinerycms_map/templates/js/markermanager.js',
    'lib/generators/refinerycms_map_generator.rb',
    'lib/map.rb',
    'lib/refinerycms-map.rb',
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
