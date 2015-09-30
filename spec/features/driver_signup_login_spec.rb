require "rails_helper"

RSpec.feature "driver" do
  before(:each) { visit root_path }
  let(:driver) {  Driver.create(name: "vane", email: "vane@mail.com", phone: 555555555, password: "pass", car_make: "Nissan", car_model: "Versa", car_capacity: 3) }

  it "creates an account" do
    click_link "Sign Up as Driver"
    fill_in "Name", with: "Vane"
    fill_in "Email", with: "vane@mail.com"
    fill_in "Phone", with: 5555555555
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    fill_in "Car make", with: "Nissan"
    fill_in "Car model", with: "Versa"
    fill_in "Car capacity", with: 3
    click_button "Create Driver"

    driver = Driver.last
    assert page.has_content?("Vane")
    expect(current_path).to eq(driver_path(driver))
  end

  it "can't create an account without missing attributes" do
    click_link "Sign Up as Driver"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_button "Create Driver"

    assert page.has_content?("Name can't be blank")
  end

  it "can login" do
    visit driver_login_path
    fill_in "Email", with: driver.email
    fill_in "Password", with: "pass"
    click_button "Login"

    assert page.has_content?("Vane")
    expect(current_path).to eq(driver_path(driver))
  end

  it "can't login with invalid password" do
    visit driver_login_path
    fill_in "Email", with: driver.email
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid")
    expect(current_path).to eq(driver_login_path)
  end

  it "can logout" do
    visit driver_login_path
    fill_in "Email", with: driver.email
    fill_in "Password", with: "pass"
    click_button "Login"
    assert page.has_content?("Vane")
    assert page.has_content?("Logout")
    expect(current_path).to eq(driver_path(driver))

    click_link_or_button "Logout"
    refute page.has_content?("Vane")
    expect(current_path).to eq(root_path)
  end
end
