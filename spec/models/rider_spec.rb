require 'rails_helper'

RSpec.describe Rider, type: :model do
  let(:rider) {  Rider.create(name: "vane", email: "vane@mail.com", phone: 555555555, password: "pass") }

  it 'is valid' do
    expect(rider).to be_valid
  end

  it 'is invalid without a name' do
    rider.name = nil
    expect(rider).to_not be_valid
  end

  it 'is invalid without an email' do
    rider.email = nil
    expect(rider).to_not be_valid
  end

  it 'is invalid without a phone' do
    rider.phone = nil
    expect(rider).to_not be_valid
  end

  it 'is invalid without a password' do
    rider.password = nil
    expect(rider).to_not be_valid
  end
end
