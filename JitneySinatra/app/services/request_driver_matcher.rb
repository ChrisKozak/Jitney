class RequestDriverMatcher

  def self.find_drivers_who_can_serve_request(request)
    self.find_trips_that_overlap_request(request).map(&:driver)
  end

  def self.find_trips_that_overlap_request(request)
    [Trip.first]
  end
end