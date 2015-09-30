class Ride < ActiveRecord::Base
  belongs_to :rider
  belongs_to :driver

  enum status: [:active, :accepted, :picked_up, :completed]

  validates :pickup, presence: true
  validates :dropoff, presence: true
  validates :passenger_number, presence: true

  def driver_name
    driver.name
  end

  def rider_name
    rider.name
  end

  def car_make
    driver.car_make
  end

  def car_model
    driver.car_model
  end
end
