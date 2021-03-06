require 'rails_helper'
include Warden::Test::Helpers

describe "the add a post process" do
  it "adds a new post" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on 'Add a new post'
    fill_in 'Title', :with => 'How I Quit My Job'
    fill_in 'Body', :with => 'Happy days!'
    fill_in 'Date', :with => '2012-04-09 07:00:00'
    click_on 'Submit Your Post'
    expect(page).to have_content 'How I Quit My Job'
  end

  it "gives error when no title is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on 'Add a new post'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => '!'
    fill_in 'Date', :with => ''
    click_on 'Submit Your Post'
    expect(page).to have_content 'errors'
  end
end
