require 'refinery'
require File.expand_path('../map', __FILE__)

module Refinery
  module Map

    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_map"
          plugin.menu_match = /(admin|refinery)\/map(_locations)?$/
          plugin.url = {:controller => '/admin/map_locations', :action => 'index'}
          plugin.activity = {
            :class => MapLocation,
            :title => 'title',
            :url_prefix => 'edit'
          }
        end
      end
    end

  end
end
