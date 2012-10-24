class RequestDriverMatcher

  def self.find_drivers_who_can_serve_request(request)
    self.find_trips_that_overlap_request(request).map(&:driver)
  end

  def self.find_trips_that_overlap_request(request)
    Trip.all.select {|trip|
      requests_in_this_region = Request.where(:coordinates.within_box => trip.loc).and(:pickup_time.gt => trip.start).and(:pickup_time.lt => trip.end).find_all
      requests_in_this_region.select {|request| request == request}.count > 0
    }
  end
end