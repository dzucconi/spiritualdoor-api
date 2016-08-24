class Heading
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Float
  field :ip, type: String
  field :referer, type: String
  field :rate, type: Integer
  field :fingerprint, type: String

  index created_at: -1

  validates_presence_of :value, :rate
  validates_numericality_of :rate, greater_than_or_equal_to: 0
  validates_numericality_of :value, greater_than_or_equal_to: 0.0,
                            less_than_or_equal_to: 360.0

  after_create :location

  def location
    @location ||= Location.find_or_create_by(ip: ip || '::1')
  end

  def point
    @point ||= Compass.nearest(value)
  end

  def name
    point[:point]
  end

  def abbreviation
    point[:abbreviation]
  end

  def wind
    point[:wind]
  end

  def as_json(options = {})
    attrs = super options
    attrs['id'] = attrs['_id'].to_s
    attrs['name'] = name
    attrs['abbreviation'] = abbreviation
    attrs['wind'] = wind
    attrs.except! '_id', 'updated_at'
  end
end
