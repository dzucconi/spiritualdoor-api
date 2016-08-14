require 'rubygems'
require 'bundler'

Bundler.require

%w(
  /config/initializers/**/*.rb
  /services/**/*.rb
  /models/**/*.rb
)
  .map { |pattern| Dir[File.dirname(__FILE__) + pattern] }
  .flatten
  .each { |f| require f }

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post]
  end
end

require './api'

run SpiritualDoor::API
