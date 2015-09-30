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

  def cost
    total_time = self.dropoff_time - self.pickup_time
    subtotal = (total_time / 180) * 2
    total = subtotal.round(2)
    if total < 3
      total = 3
    end
    total
  end
end
