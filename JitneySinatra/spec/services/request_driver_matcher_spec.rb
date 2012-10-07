require 'rspec'
require File.join(File.dirname(__FILE__), '../spec_helper')
require File.join(File.dirname(__FILE__), '../../app/services/request_driver_matcher')
require File.join(File.dirname(__FILE__), '../../app/models/request')
require File.join(File.dirname(__FILE__), '../../app/models/trip')



describe "Application controller" do

  it "should return trips that overlap a request" do
    request = Request.create!(
        address: "State and Lake, Chicago, IL",
        coordinates: [ 1,1 ]
    )

    matching_trip = Trip.create!(
        name: "Rick's Saturday Bar Run",
        loc: [[0,0],[100,100]],
    )
    trips = RequestDriverMatcher.find_trips_that_overlap_request request

    trips.first.should be(matching_trip)
  end

  it "should return drivers whose trips overlap a request"
end