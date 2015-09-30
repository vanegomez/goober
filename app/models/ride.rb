class Ride < ActiveRecord::Base
  belongs_to :rider
  belongs_to :driver

  enum status: [:active, :accepted, :picked_up, :completed]

  validates :pickup, presence: true
  validates :dropoff, presence: true
  validates :passenger_number, presence: true
end
