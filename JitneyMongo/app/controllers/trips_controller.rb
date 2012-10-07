class TripsController < ApplicationController
  before_filter :authenticate_driver!
  
  def new 
    @trip = current_driver.trips.build
  end
  
  
  def create
    @trip = current_driver.trips.build(params[:trip])
    if params[:phone_number]
      current_driver.update_attributes(phone: params[:phone_number])
      current_driver.save!
    end
    if @trip.save!
      flash[:notice] = "Trip successfully saved"
      redirect_to new_trip_path
    end
  end

end
