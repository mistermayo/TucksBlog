require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    visit posts_path
    click_on 'Add a new comment'
    fill_in 'Description', :with => 'Capybara is rough times'
    click_on 'Submit Your Post'
    expect(page).to have_content 'Posts'
  end

  it "gives error when no name is entered" do
    visit root_path
    click_on 'Add a new comment'
    fill_in 'Title', :with => ''
    click_on 'Submit Your Post'
    expect(page).to have_content 'errors'
  end
end
