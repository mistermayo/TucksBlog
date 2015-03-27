require 'rails_helper'

describe "the edit a post process" do

  it "gives error when no title is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => 'rowdy licorice'
    fill_in 'Date', :with => ''
    click_on 'Submit Your Post'
    expect(page).to have_content 'errors'
  end

  it "gives error when no body is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'rowdy licoricia'
    fill_in 'Body', :with => ''
    fill_in 'Date', :with => ''
    click_on 'Submit Your Post'
    expect(page).to have_content 'errors'
  end

  it "edits a post" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'Knitting and Kama Sutra'
    fill_in 'Body', :with => 'I love my cat'
    fill_in 'Date', :with => '2012-04-09 07:00:00'
    click_on 'Submit Your Post'
    expect(page).to have_content 'Knitting and Kama Sutra'
  end

  it "takes you to an edit post page" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on 'Edit'
    expect(page).to have_content 'Edit'
  end
end
