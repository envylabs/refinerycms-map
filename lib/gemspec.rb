#!/usr/bin/env ruby
require File.expand_path('../map.rb', __FILE__)
version = ::Refinery::Map.version
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem(spec)?$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-map}
  s.version           = %q{#{version}}
  s.description       = %q{A RefineryCMS plugin that displays an interactive Google map with flaggable locations.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Ruby on Rails map engine for RefineryCMS.}
  s.email             = %q{lab@envylabs.com}
  s.homepage          = %q{http://github.com/envylabs/refinerycms-map}
  s.authors           = %w(Envy\\ Labs)
  s.require_paths     = %w(lib)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}
end
EOF

File.open(File.expand_path("../../refinerycms-map.gemspec", __FILE__), 'w').puts(gemspec)
