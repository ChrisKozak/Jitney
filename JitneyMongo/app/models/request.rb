
class Request
  include Mongoid::Document
  field :address, type: String
  field :coordinates, type: Array
  belongs_to :user
end
