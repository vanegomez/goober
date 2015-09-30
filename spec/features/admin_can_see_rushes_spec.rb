require "rails_helper"

RSpec.feature "rider" do
  before(:each) { visit root_path }
  let(:admin) {  Rider.create(name: "admin", email: "admin@mail.com", phone: 555555555, password: "pass", role: 1) }
  let(:rider) {  Rider.create(name: "vane", email: "vane@mail.com", phone: 555555555, password: "pass") }

  it "can't see admin rushes if you are a regular rider" do
    visit admin_rushes_path
    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
