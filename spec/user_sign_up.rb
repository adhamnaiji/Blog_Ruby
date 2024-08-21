
require 'rails_helper'

RSpec.feature "UserSignup", type: :feature do
  scenario "User signs up successfully" do
    visit '/users/sign_up'

    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Sign up"

    #el expectation vs reality 
    expect(page).to have_content("Articles")

    user = User.find_by(email: "testuser@example.com")
    expect(user).to be_present
  end
end


