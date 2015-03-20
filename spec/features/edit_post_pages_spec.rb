require 'rails_helper'

describe "the edit a post process" do

  it "gives error when no title and body is entered" do
    post = Post.create(:title => 'Home stuff')
    post = Post.create(:body => 'Frank and Beans')
    visit posts_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => ''
    click_on 'Submit Your Post'
    expect(page).to have_content 'errors'
  end

  it "edits a post" do
    post = Post.create(:title => 'Knitting 101')
    post = Post.create(:body => 'Frank and Beans')
    visit posts_path
    click_on 'Edit'
    fill_in 'Title', :with => 'Knitting and Kama Sutra'
    fill_in 'Body', :with => 'I love my cat'
    click_on 'Submit Your Post'
    expect(page).to have_content 'Knitting and Kama Sutra'
  end

end
