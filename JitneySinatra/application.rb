require 'sinatra'
require 'sinatra/partial'
require 'geocoder'
require File.join(File.dirname(__FILE__), 'app/models/rider')
Mongoid.load!("mongoid.yml")


post '/request_ride' do
  get_rider(params[:number])
  create_request(params[:body])
end

def get_rider(phone_number)
  @rider = Rider.where(phone: phone_number).first
  @rider = Rider.create!(phone: phone_number) unless @rider
end

def create_request(text_address)
  geo_info = derive_lat_long_from_text(text_address)[0]
  @rider.requests.build(address: text_address, coordinates: [geo_info.latitude, geo_info.longitude]).save!
end

def derive_lat_long_from_text text_address
  Geocoder.search(text_address)
end

