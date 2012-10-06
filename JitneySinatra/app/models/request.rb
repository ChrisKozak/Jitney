require File.join(File.dirname(__FILE__), 'rider')

class Request
  include Mongoid::Document
  field :address, type: String
  field :coordinates, type: Array
  belongs_to :rider
end