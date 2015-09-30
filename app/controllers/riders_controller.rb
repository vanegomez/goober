class RidersController < ApplicationController
  before_action 'require_rider', except: [:new, :create]

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

  def require_rider
    render root_path if current_rider == nil
  end
end
