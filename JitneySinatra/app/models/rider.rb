require 'mongoid'
require File.join(File.dirname(__FILE__), 'request')


class Rider
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String
  has_many :requests
end