require 'rails_helper'

RSpec.describe Driver, type: :model do
  let(:driver) {  Driver.create(name: "vane", email: "vane@mail.com", phone: 555555555, password: "pass", car_make: "Nissan", car_model: "Versa", car_capacity: 3) }

  it 'is valid' do
    expect(driver).to be_valid
  end

  it 'is invalid without a name' do
    driver.name = nil
    expect(driver).to_not be_valid
  end

  it 'is invalid without an email' do
    driver.email = nil
    expect(driver).to_not be_valid
  end

  it 'is invalid without a phone' do
    driver.phone = nil
    expect(driver).to_not be_valid
  end

  it 'is invalid without a password' do
    driver.password = nil
    expect(driver).to_not be_valid
  end

  it 'is invalid without a car make' do
    driver.car_make = nil
    expect(driver).to_not be_valid
  end

  it 'is invalid without a car model' do
    driver.car_model = nil
    expect(driver).to_not be_valid
  end

  it 'is invalid without a car capacity' do
    driver.car_capacity = nil
    expect(driver).to_not be_valid
  end
end
