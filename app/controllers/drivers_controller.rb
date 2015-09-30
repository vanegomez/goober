class DriversController < ApplicationController
  before_action 'require_driver'

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      session[:driver_id] = @driver.id
      redirect_to @driver
    else
      flash.now[:errors] = @driver.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :email, :phone, :password, :password_confirmation, :car_make, :car_model, :car_capacity)
  end

  def require_driver
    render root_path if current_driver == nil
  end
end
