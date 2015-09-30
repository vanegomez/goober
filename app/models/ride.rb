class Ride < ActiveRecord::Base
  belongs_to :rider
  belongs_to :driver

  enum status: [:active, :accepted, :picked_up, :completed]

  validates :rider_id, presence: true
  validates :driver_id, presence: true
  validates :pickup, presence: true
  validates :dropoff, presence: true
  validates :passenger_number, presence: true
end
