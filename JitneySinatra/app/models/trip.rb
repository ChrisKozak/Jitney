require File.join(File.dirname(__FILE__), '../../app/models/driver')

class Trip
  include Mongoid::Document

  field :name, type: String
  field :loc, type: Array
  field :start, type: DateTime
  field :end, type: DateTime
  belongs_to :driver
end