require 'sinatra'
require 'sinatra/partial'
require 'geocoder'
require File.join(File.dirname(__FILE__), 'app/models/rider')
require File.join(File.dirname(__FILE__), 'app/models/request')
require File.join(File.dirname(__FILE__), 'app/models/trip')
require File.join(File.dirname(__FILE__), 'app/services/request_driver_matcher')
Mongoid.load!("mongoid.yml")

post '/confirm_ride' do
  get_driver(params[:number])
  #Associate request with driver
  #Confirm with rider
end

post '/request_ride' do
  get_rider(params[:number])
  request = create_request(params[:body])
  notify_relevant_drivers_of(request)
end

def notify_relevant_drivers_of(ride_request)
  drivers = RequestDriverMatcher.find_drivers_who_can_serve_request(ride_request)
  drivers.each {|driver| driver.notify_of(ride_request)}
end

def get_rider(phone_number)
  @rider = Rider.where(phone: phone_number).first
  @rider = Rider.create!(phone: phone_number) unless @rider
  #If first ride, remind rider that they will be hunted down if they do anything stupid
end

def create_request(text_address)
  geo_info = derive_lat_long_from_text(text_address)[0]
  @rider.requests.create!(address: text_address, coordinates: [geo_info.latitude, geo_info.longitude])
end

def derive_lat_long_from_text text_address
  Geocoder.search(text_address)
end

