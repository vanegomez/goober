class Admin::RushesController < Admin::BaseController
  def index
    @rides = Ride.all
    @rushes = Rush.all
  end
end
