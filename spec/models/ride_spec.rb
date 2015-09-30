require 'rails_helper'

RSpec.describe Ride, type: :model do
  let(:driver) {  Driver.create(name: "Vane", email: "driver@mail.com", phone: 555555555, password: "pass", car_make: "Nissan", car_model: "Versa", car_capacity: 3) }
  let(:rider) {  Rider.create(name: "Horace", email: "rider@mail.com", phone: 555555555, password: "pass") }

  let(:ride) { Ride.new(rider_id: rider.id, driver_id: driver.id, pickup: "pickup address", dropoff: "dropoff address", passenger_number: 3, pickup_time: "2015-09-30 19:20:52", dropoff_time: "2015-09-30 19:25:28") }

  it 'is valid' do
    expect(ride).to be_valid
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

  it 'responds to driver name' do
    expect(ride.driver_name).to eq("Vane")
  end

  it 'responds to rider name' do
    expect(ride.rider_name).to eq("Horace")
  end

  it 'responds to car make' do
    expect(ride.car_make).to eq("Nissan")
  end

  it 'responds to car model' do
    expect(ride.car_model).to eq("Versa")
  end

  it 'responds to cost' do
    expect(ride.cost).to eq(3.07)
  end
end
