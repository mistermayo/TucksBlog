require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_on 'Add a new post'
    fill_in 'Title', :with => 'How I Quit My Job'
    fill_in 'Body', :with => 'Happy days!'
    click_on 'Submit Your Post'
    expect(page).to have_content 'Posts'
  end

  it "gives error when no name is entered" do
    visit root_path
    click_on 'Add a new post'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => '!'
    click_on 'Submit Your Post'
    expect(page).to have_content 'errors'
  end
end
