require 'rails_helper'

RSpec.feature "ArticlesAccess", type: :feature do
  let(:user) { create(:user) }

  scenario "Unauthenticated user is redirected to sign-in page when trying to access articles index" do
    visit articles_path

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario "Authenticated user can access articles index" do
    sign_in user
    puts user.email
    visit articles_path

    expect(page).to have_current_path(articles_path)
    expect(page).to have_content("Articles")
    expect(page).to have_content("New Article")
    expect(page).to have_content("Edit profile")
   
  end
end
