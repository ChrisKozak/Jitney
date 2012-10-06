class Trip
  include Mongoid::Document
  
  field :name, type: String
  field :start, type: DateTime
  field :loc, type: Array
  field :end, type: DateTime
  
  acts_as_gmappable :position => :loc
  
end
