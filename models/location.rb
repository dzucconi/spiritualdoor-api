class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  field :ip, type: String
  field :coordinates, type: Array
  field :city, type: String
  field :country, type: String

  index({ ip: 1 }, unique: true)

  validates_presence_of :ip

  geocoded_by :ip

  reverse_geocoded_by :coordinates do |location, results|
    if geo = results.first
      location.city = geo.city
      location.country = geo.country
      geo
    end
  end

  after_create :full_geocode

  def full_geocode
    geocode
    reverse_geocode
  end

  def as_json(options = {})
    attrs = super options
    attrs['id'] = attrs['_id'].to_s
    attrs.except! '_id', 'updated_at'
  end
end
