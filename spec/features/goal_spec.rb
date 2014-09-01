require "rails_helper"

feature "goals" do
  before(:each) do
    User.create(username: "test", password: "something")
    Goal.create(
      title: "one",
      private: false,
      user_id: User.first.id,
      body: "this is a test"
      )
    
    visit new_session_url
    fill_in 'Username', with: "test"
    fill_in 'Password', with: "something"
    click_on "Sign in"
  end  
  
  scenario "has a new form on user page" do  
    expect(page).to have_content("New goal")
    expect(page).to have_button("Add goal")
  end
  
  scenario "fill in new goal form" do
    fill_in "Title", with: "lose weight"
    fill_in "Body", with: "10lbs"
    fill_in "Deadline", with: 1.week.from_now.to_date
    choose "Public"
    click_on "Add goal"
    
    expect(page).to have_link("lose weight")
    # expect(page).to have_content(1.week.from_now.to_date)
    expect(page).to have_button("Delete")
  end
  
  scenario "newly-created goal has a show page" do
    click_on "one"

    expect(page).to have_content("one")
    expect(page).to have_content("this is a test")
    expect(page).to have_link("Edit")
  end
  
  scenario "updated goal shows success" do
    click_on "one"
    click_on "Edit goal"
    
    expect(page).to have_content("one")
    expect(page).to have_content("this is a test")
    
    fill_in "Title", with: "new title!"
    click_on "Update goal"
    
    expect(page).to have_content('Goal updated!')
  end
end