require 'rails_helper'

RSpec.describe Ride, type: :model do
  let(:driver) {  Driver.create(name: "driver", email: "driver@mail.com", phone: 555555555, password: "pass", car_make: "Nissan", car_model: "Versa", car_capacity: 3) }
  let(:rider) {  Rider.create(name: "rider", email: "rider@mail.com", phone: 555555555, password: "pass") }

  let(:ride) { Ride.new(rider_id: rider.id, driver_id: driver.id, pickup: "pickup address", dropoff: "dropoff address", passenger_number: 3) }

  it 'is valid' do
    expect(ride).to be_valid
  end

  it 'is invalid without a rider' do
    ride.rider_id = nil
    expect(ride).to_not be_valid
  end

  it 'is invalid without a driver' do
    ride.driver_id = nil
    expect(ride).to_not be_valid
  end

  it 'is invalid without a pickup address' do
    ride.pickup = nil
    expect(ride).to_not be_valid
  end

  it 'is invalid without a dropoff address' do
    ride.dropoff = nil
    expect(ride).to_not be_valid
  end

  it 'is invalid without passenger number' do
    ride.passenger_number = nil
    expect(ride).to_not be_valid
  end
end
