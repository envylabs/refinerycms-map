# Refinery CMS Map Plugin

## About

__This plugin adds a Google map with any number of flagged locations.__

Key features:

* Admin interface allows you to set the locations that will be displayed on the map.
* Clicking a location on the map shows address, phone number, and url for that location.

## How do I use it?

To install the map plugin, you can either include the gem or install as a plugin.

## Requirements

[RefineryCMS](http://refinerycms.com) version 0.9.7 or later.

### Gem Installation using Bundler

Include the latest [gem](http://rubygems.org/gems/refinerycms-map) into your Refinery CMS application's Gemfile:

    gem "refinerycms-map", '~> 0.0.1', :require => "map"

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install
    script/generate map
    rake db:migrate

### Rails Engine Installation

If you do not want to install the engine via bundler then you can install it as an engine inside your application's vendor directory.
Type the following at command line inside your Refinery CMS application's root directory:

    script/plugin install git://github.com/envylabs/refinerycms-map.git
    script/generate map
    rake db:migrate
