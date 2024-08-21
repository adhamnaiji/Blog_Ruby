# spec/features/user_login_spec.rb

require 'rails_helper'

RSpec.feature 'User Login', type: :feature do
  let(:user) { FactoryBot.create(:user, email: 'adham@example.com', password: '123456') }

  scenario 'with valid credentials' do
    visit '/users/sign_in'


    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    #expect(page).to have_content('Welcome, adham@example.com')
    expect(page).to have_content('Articles')
  end

  scenario 'with invalid credentials' do
    visit '/users/sign_in'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'wrongpassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid email or password')
    expect(current_path).to eq('/users/sign_in')
  end
end
