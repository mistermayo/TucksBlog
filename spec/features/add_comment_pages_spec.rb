require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on "Add a comment"
    fill_in 'Description', :with => 'Hello'
    click_on 'Create Comment'
    expect(page).to have_content 'Hello'
  end

  it "gives error when no description is entered" do
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on "Add a comment"
    fill_in 'Description', :with => ''
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end
