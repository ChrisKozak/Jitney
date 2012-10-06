require 'spec_helper'
describe UsersController do
  it "should create a new user when the request's phone number is unrecognized" do
    User.where(phone: '1234567890').first.should be(nil)
    params = {:phone_number => "1234567890", :body => "LOCATION_STRING"}
    post :ride_request
    User.where(phone: '1234567890').first.should_not be(nil)  
  end

  it "should keep the request for cross-referencing"

end