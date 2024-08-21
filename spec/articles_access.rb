require 'rails_helper'

RSpec.feature "ArticlesAccess", type: :feature do
  let(:user) { create(:user) }

  scenario "Unauthenticated user is redirected to sign-in page when trying to access articles index" do
    visit '/users/sign_in'

    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content("Sign up")
  end

  scenario "Authenticated user can access articles index" do
    sign_in user
    #test if it actually getting the user 
    puts user.email
    puts user.remember_created_at
    visit articles_path

    expect(page).to have_current_path(articles_path)
    expect(page).to have_content("Articles")
    expect(page).to have_content("New Article")
    expect(page).to have_content("Edit profile")
   
  end
end
