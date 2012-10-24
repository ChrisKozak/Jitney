require 'chronic'
require 'rspec'
require File.join(File.dirname(__FILE__), '../spec_helper')
require File.join(File.dirname(__FILE__), '../../app/services/request_driver_matcher')
require File.join(File.dirname(__FILE__), '../../app/models/request')
require File.join(File.dirname(__FILE__), '../../app/models/trip')
require 'pry'

describe "Application controller" do

  before(:each) do
    Request.delete_all
    Trip.delete_all
  end

  it "should return trips that overlap a request in time" do
    request = Request.create!(
        address: "State and Lake, Chicago, IL",
        coordinates: [ 1,1 ],
        pickup_time: Chronic.parse('tomorrow 10 in the morning'),
    )

    matching_trip = Trip.create!(
        name: "Gertrude's Saturday Morning Run",
        loc: [[0,0],[100,100]],
        start: Chronic.parse('tomorrow 8 in the morning'),
        end: Chronic.parse('tomorrow noon'),
    )

    non_matching_trip = Trip.create!(
        name: "Rick's Saturday Bar Run",
        loc: [[0,0],[100,100]],
        start: Chronic.parse('tomorrow at 10pm'),
        end: Chronic.parse('tomorrow at 11pm'),
    )

    trips = RequestDriverMatcher.find_trips_that_overlap_request request

    trips.size.should eq 1
    trip = trips.first
    trip.start.should eq(matching_trip.start)
    trip.end.should eq(matching_trip.end)
    trip.loc.should eq(matching_trip.loc)
  end

  it "should return trips that overlap a request in space" do
    request = Request.create!(
        address: "State and Lake, Chicago, IL",
        coordinates: [ 1,1 ],
        pickup_time: Chronic.parse('tomorrow at 9pm'),
    )

    matching_trip = Trip.create!(
        name: "Rick's Saturday Bar Run",
        loc: [[0,0],[100,100]],
        start: Chronic.parse('tomorrow at 8pm'),
        end: Chronic.parse('tomorrow at 11pm'),
    )

    non_matching_trip = Trip.create!(
        name: "Rick's Saturday Bar Run",
        loc: [[0,0],[-100,-100]],
        start: Chronic.parse('tomorrow at 8pm'),
        end: Chronic.parse('tomorrow at 11pm'),
    )

    trips = RequestDriverMatcher.find_trips_that_overlap_request request

    trips.size.should eq 1
    trip = trips.first
    trip.start.should eq(matching_trip.start)
    trip.end.should eq(matching_trip.end)
    trip.loc.should eq(matching_trip.loc)
  end

  it "should return drivers whose trips overlap a request"
  it "should return drivers whose trip times overlap a request"

end