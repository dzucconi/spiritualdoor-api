class Heading
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ip, type: String
  field :value, type: Float
  field :referer, type: String
  field :source, type: String

  index({ created_at: -1 })

  validates_presence_of :value, :source

  def as_json(options = {})
    attrs = super(options)
    attrs['id'] = attrs['_id'].to_s
    attrs.delete('_id')
    attrs
  end
end
