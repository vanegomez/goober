class RidersController < ApplicationController
  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(rider_params)
    if @rider.save
      session[:rider_id] = @rider.id
      redirect_to @rider
    else
      flash.now[:errors] = @rider.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def rider_params
    params.require(:rider).permit(:name, :email, :phone, :password, :password_confirmation)
  end
end
