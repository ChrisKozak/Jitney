require 'sinatra'
require 'sinatra/partial'
require 'geocoder'
require File.join(File.dirname(__FILE__), 'app/models/rider')
Mongoid.load!("mongoid.yml")


post '/request_ride' do
  phone_number = params[:number]
  @rider = Rider.where(phone: phone_number).first
  @rider = Rider.create!(phone: phone_number) unless @rider

  text_address = params[:body]
  @rider.requests.build(address: text_address, coordinates: derive_lat_long_from_text(text_address)).save!

end

def derive_lat_long_from_text text_address
  Geocoder.search(text_address)
end

