class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  field :ip, type: String
  field :coordinates, type: Array
  field :address, type: String

  index({ ip: 1 }, unique: true)

  validates_presence_of :ip

  geocoded_by :ip
  reverse_geocoded_by :coordinates

  after_validation :geocode
end
