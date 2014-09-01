require 'rails_helper'

feature "goal comment" do
  before(:each) do
    sign_in
    @user = User.first
    @goal = Goal.create(title: "title", body: "body", user_id: @user.id)
    visit user_url(@user)
  end 
  
  scenario "add comment form on goal page" do
    expect(page).to have_button "Comment"
  end
  
  
  scenario "appears on goal page" do
    fill_in "comment_box", with: "some text"
    click_button "Comment"
    
    expect(page).to have_content "some text"
  end
end