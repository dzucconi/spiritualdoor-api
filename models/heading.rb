class Heading
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Float
  field :ip, type: String
  field :referer, type: String
  field :rate, type: Integer

  index created_at: -1

  validates_presence_of :value, :rate
  validates_numericality_of :rate, greater_than_or_equal_to: 0
  validates_numericality_of :value, greater_than_or_equal_to: 0.0,
                            less_than_or_equal_to: 360.0

  def as_json(options = {})
    attrs = super options
    attrs['id'] = attrs['_id'].to_s
    attrs.except! '_id', 'updated_at'
  end
end
