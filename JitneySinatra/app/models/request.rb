require File.join(File.dirname(__FILE__), 'rider')

class Request
  include Mongoid::Document
  field :address,     type: String
  field :coordinates, type: Array
  field :pickup_time, type: DateTime
  belongs_to :rider

  index coordinates: "2d"
end