require 'spec_helper'

feature "sign in" do
  scenario "has a sign in page" do
    visit new_session_url
    expect(page).to have_content "Sign in"
    expect(page).to have_button "Sign in"
  end

  feature "sign in a user" do
    before(:each) do
      User.create(username: "test_user", password: "something")
      
      visit new_session_url
      fill_in 'Username', with: "test_user"
      fill_in 'Password', with: "something"
      click_on "Sign in"
    end

    scenario "redirect to user page after sign in" do
      expect(page).to have_content "test_user"
    end

    scenario "shows sign out button" do
      expect(page).to have_button "Sign out"
    end

    scenario "does not show sign in button" do
      expect(page).not_to have_link "Sign in"
    end
  end
    
  feature "invalid user/password" do
    scenario "displays error on invalid sign in" do
      visit new_session_url
      fill_in "Username", with: "blah"
      fill_in "Password", with: "blah"
      click_on "Sign in"
      
      expect(page).to have_content "Invalid username or password."
    end
  end
end