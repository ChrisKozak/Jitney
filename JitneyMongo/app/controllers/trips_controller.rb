class TripsController < ApplicationController
  before_filter :authenticate_driver!
  
  def new 
    @trip = current_driver.trips.build
  end
  
  def create
    @trip = current_driver.trips.build(params[:trip])
    if @trip.save!
      redirect_to root_path
    end
  end

end
