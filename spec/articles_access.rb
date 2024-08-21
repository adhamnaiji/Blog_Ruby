require 'rails_helper'

RSpec.feature "ArticlesAccess", type: :feature do
  let(:user) { create(:user) }

  scenario "Unauthenticated user is redirected to sign-in page when trying to access articles index" do
    visit '/users/sign_in'

    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content("Log in")
    expect(page).to have_content("Sign up")

    expect(page).to have_content("Forgot your password?")

  end

  scenario "Authenticated user can access articles index" do
    sign_in user
    visit '/'

    expect(page).to have_current_path('/')
    expect(page).to have_content("Articles") 
  end
end
