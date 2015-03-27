require 'rails_helper'

describe "the creating a new user process" do
  it "will add a new user" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'foo@foo.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

describe "logging in" do
  it "Will log in a user" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end

describe 'logging out' do
  it 'will log out a user' do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end

describe 'visiting user profile' do
  it "will go to a users profile" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'Profile'
    expect(page).to have_content user.email + "'s profile"
  end

  it "will allow a logged in user to edit their profile" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'Profile'
    click_link 'edit profile'
    expect(page).to have_content "edit profile page"
  end

  it "will not allow a logged in user to edit someone else's profile" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'foo@me.com')
    login(user)
    click_link 'Users'
    click_link user2.email
    expect(page).to have_no_content "edit profile"
  end

  it "will allow a logged in user to input profile info" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'Profile'
    click_link 'edit profile'
    fill_in 'Name', with: 'Mike'
    fill_in 'Bio', with: 'something cool here'
    click_button 'Update profile'
    expect(page).to have_content "Profile updated."
  end

end
