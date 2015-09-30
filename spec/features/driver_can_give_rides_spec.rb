require "rails_helper"

RSpec.feature "driver" do
  let(:driver) {  Driver.create(name: "vane", email: "driver@mail.com", phone: 555555555, password: "pass", car_make: "Nissan", car_model: "Versa", car_capacity: 3) }
  let(:rider) {  Rider.create(name: "vane", email: "rider@mail.com", phone: 555555555, password: "pass") }
  let(:ride) { Ride.create(rider_id: rider.id, pickup: "here", dropoff: "there", passenger_number: 2) }

  before(:each) do
    visit root_path
    driver
    rider
    ride
    click_link "Driver Login"

    expect(current_path).to eq(driver_login_path)

    fill_in("Email", with: "driver@mail.com")
    fill_in("Password", with: "pass")

    click_button("Login")
    expect(current_path).to eq(driver_path(driver))
    assert page.has_content?("Vane")
  end

  it "can see active rides" do
    assert page.has_content?("Available Rides")
  end

  it "can't see current ride" do
    refute page.has_content?("Current Ride")
  end

  it "can accept to give a ride" do
    assert page.has_content?("Available Rides")
    click_link "Accept"
    assert page.has_content?("Current Ride")
  end

  it "can change the status of an accepted ride" do
    assert page.has_content?("Available Rides")
    click_link "Accept"
    assert page.has_content?("Current Ride")

    click_link "Pick up Rider"
    refute page.has_content?("Pick up Rider")
    assert page.has_content?("Complete Ride")

    click_link "Complete Ride"
    refute page.has_content?("Complete Ride")
    assert page.has_content?("Available Rides")
  end
end
