require 'rubygems'
require 'bundler'

Bundler.require

%w(
  /config/initializers/**/*.rb
  /models/**/*.rb
)
  .map { |pattern| Dir[File.dirname(__FILE__) + pattern] }
  .flatten
  .each { |f| require f }

require './api'

run SpiritualDoor::API
