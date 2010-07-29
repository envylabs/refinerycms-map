class MapGenerator < Rails::Generator::NamedBase

  def initialize(*runtime_args)
    # set first argument to the table's name so that the user doesn't have to pass it in.
    runtime_args[0] = ["map_locations"]
    super(*runtime_args)
  end

  def banner
    "Usage: script/generate map"
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate',
        :migration_file_name => "create_structure_for_map",
        :assigns => {
          :migration_name => "CreateStructureForMap",
          :table_name => "map_locations",
          :attributes => [
            Rails::Generator::GeneratedAttribute.new("title", "string"),
            Rails::Generator::GeneratedAttribute.new("address", "string"),
            Rails::Generator::GeneratedAttribute.new("city", "string"),
            Rails::Generator::GeneratedAttribute.new("state", "string"),
            Rails::Generator::GeneratedAttribute.new("zipcode", "string"),
            Rails::Generator::GeneratedAttribute.new("phone", "string"),
            Rails::Generator::GeneratedAttribute.new("url", "string"),
          ]
        }
      m.file "jquery.jmapping.min.js", "public/javascripts/jquery.jmapping.min.js"
      m.file "jquery.metadata.js", "public/javascripts/jquery.metadata.js"
      m.file "mapiconmaker.js", "public/javascripts/mapiconmaker.js"
      m.file "markermanager.js", "public/javascripts/markermanager.js"
    end
  end

end if defined?(Rails::Generator::NamedBase)
