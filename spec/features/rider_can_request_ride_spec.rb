require "rails_helper"

RSpec.feature "rider" do
  let(:driver) {  Driver.create(name: "vane", email: "driver@mail.com", phone: 555555555, password: "pass", car_make: "Nissan", car_model: "Versa", car_capacity: 3) }
  let(:rider) {  Rider.create(name: "vane", email: "rider@mail.com", phone: 555555555, password: "pass") }
  let(:ride) { Ride.create(rider_id: rider.id, pickup: "here", dropoff: "there", passenger_number: 2) }

  before(:each) do
    visit root_path
    driver
    rider
    click_link "Rider Login"

    expect(current_path).to eq(rider_login_path)

    fill_in("Email", with: "rider@mail.com")
    fill_in("Password", with: "pass")

    click_button("Login")
    expect(current_path).to eq(rider_path(rider))
    assert page.has_content?("Vane")
  end

  it "can request a ride" do
    assert page.has_content?("Request a Ride")
    refute page.has_content?("Where do you want to go?")

    click_link "Request a Ride"
    assert page.has_content?("Where do you want to go?")
    expect(current_path).to eq(new_ride_path)

    fill_in "Pickup Address", with: "Here"
    fill_in "Dropoff Address", with: "There"
    fill_in "Number of Passengers", with: 2
    click_button "Request a ride"

    expect(current_path).to eq(rider_path(rider))
    assert page.has_content?("You have an active ride request")
    refute page.has_content?("Request a Ride")
  end

  it "can't request a ride with missing fields" do
    click_link "Request a Ride"
    fill_in "Pickup Address", with: "Here"
    fill_in "Dropoff Address", with: "There"
    click_button "Request a ride"

    assert page.has_content?("Passenger number can't be blank")
  end
end
