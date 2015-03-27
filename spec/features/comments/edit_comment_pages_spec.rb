require 'rails_helper'


describe "the edit a comment process" do
  it "edits the comment" do
    visit "/"
    user = FactoryGirl.create(:user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    comment = Comment.create(:description => 'fingersmith', :post_id => post.id)
    visit post_path(post)
    page.first(:link, "Edit").click
    fill_in 'Description', :with => 'Hello'
    click_on 'Update Comment'
    expect(page).to have_content 'Hello'
  end

  it "gives error when no description is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    comment = Comment.create(:description => 'fingersmith', :post_id => post.id)
    visit post_path(post)
    page.first(:link, "Edit").click
    fill_in 'Description', :with => ''
    click_on 'Update Comment'
    expect(page).to have_content 'errors'
  end

  it "takes you to an edit comment page" do
    visit "/"
    user = FactoryGirl.create(:user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    comment = Comment.create(:description => 'fingersmith', :post_id => post.id)
    visit post_path(post)
    page.first(:link, "Edit").click
    expect(page).to have_content 'Edit'
  end
end
