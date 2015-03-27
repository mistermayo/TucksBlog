require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_no_content 'hole'

  end
end
