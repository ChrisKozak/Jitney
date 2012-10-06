class User
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String
  has_many :requests
end
