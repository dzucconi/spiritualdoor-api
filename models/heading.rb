class Heading
  include Mongoid::Document

  field :ip, type: String
  field :value, type: Float
  field :referer, type: String
  field :source, type: String
end
