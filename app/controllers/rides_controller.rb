class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.rider_id = current_rider.id
    @ride.requested_time = DateTime.now
    if @ride.save
      redirect_to rider_path(current_rider)
    else
      flash.now[:errors] = @ride.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.status == "active"
      @ride.update_attributes(driver_id: current_driver.id, accepted_time: Time.now, status: 1)
    elsif @ride.status == "accepted"
      @ride.update_attributes(pickup_time: Time.now, status: 2)
    else
      @ride.update_attributes(dropoff_time: Time.now, status: 3)
    end
    redirect_to driver_path(current_driver)
  end

  private

  def ride_params
    params.require(:ride).permit(:pickup, :dropoff, :passenger_number)
  end
end
