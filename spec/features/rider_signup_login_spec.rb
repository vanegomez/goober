require "rails_helper"

RSpec.feature "rider" do
  before(:each) { visit root_path }
  let(:rider) {  Rider.create(name: "vane", email: "vane@mail.com", phone: 555555555, password: "pass") }

  it "creates an account" do
    click_link "Sign Up as Rider"
    fill_in "Name", with: "Vane"
    fill_in "Email", with: "vane@mail.com"
    fill_in "Phone", with: 5555555555
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_button "Create Rider"

    rider = Rider.last
    assert page.has_content?("Vane")
    expect(current_path).to eq(rider_path(rider))
  end

  it "can't create an account without missing attributes" do
    click_link "Sign Up as Rider"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_button "Create Rider"

    assert page.has_content?("Name can't be blank")
  end

  it "can login" do
    visit rider_login_path
    fill_in "Email", with: rider.email
    fill_in "Password", with: "pass"
    click_button "Login"

    assert page.has_content?("Vane")
    expect(current_path).to eq(rider_path(rider))
  end

  it "can't login with invalid password" do
    visit rider_login_path
    fill_in "Email", with: rider.email
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid")
    expect(current_path).to eq(rider_login_path)
  end

  it "can logout" do
    visit rider_login_path
    fill_in "Email", with: rider.email
    fill_in "Password", with: "pass"
    click_button "Login"
    assert page.has_content?("Vane")
    assert page.has_content?("Logout")
    expect(current_path).to eq(rider_path(rider))

    click_link_or_button "Logout"
    refute page.has_content?("Vane")
    expect(current_path).to eq(root_path)
  end
end
