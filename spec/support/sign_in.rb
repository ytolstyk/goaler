def sign_in(username = "test_user", password = "something")
  visit new_user_url
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  click_on "Sign up"
end
