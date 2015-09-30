class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_driver, :current_rider, :available_rides

  def current_driver
    @current_driver ||= Driver.find(session[:driver_id]) if session[:driver_id]
  end

  def current_rider
    @current_rider ||= Rider.find(session[:rider_id]) if session[:rider_id]
  end

  def available_rides
    Ride.where(status: 0).where("passenger_number <= ?", current_driver.car_capacity)
  end
end
