require 'spec_helper'

feature "signup" do
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up"
    expect(page).to have_link "Sign in"
    expect(page).to have_button "Sign up" # submit
  end
  
  feature "sign up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "test_user"
      fill_in 'Password', with: "something"
      click_on "Sign up"
    end
    
    scenario "redirect to user page after signup" do
      expect(page).to have_content "test_user"
    end
    
    # scenario "shows sign out button" do
    #   expect(page).to have_button "Sign out"
    # end
    
    scenario "does not show sign in button" do
      expect(page).not_to have_link "Sign in"
    end
  end
  
  feature "displays errors on invalid signup" do
    before(:each) do
      visit new_user_url
    end
    
    scenario "show username can't be blank error" do
      fill_in "Password", with: "something"
      click_on "Sign up"
      expect(page).to have_content "Username can't be blank"
    end
    
    scenario "show password can't be blank error" do
      fill_in "Username", with: "something"
      fill_in "Password", with: "short"
      click_on "Sign up"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end
end