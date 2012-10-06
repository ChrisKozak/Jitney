require "rspec"
require File.join(File.dirname(__FILE__), '../../app/models/rider')

describe "rider controller" do

  it "should create a new rider account when a request comes from an unrecognized rider" do
    true.should == false
  end
end