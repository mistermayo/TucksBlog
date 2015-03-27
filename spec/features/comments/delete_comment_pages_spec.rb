require 'rails_helper'


describe "the delete a comment process" do
  it "deletes the comment" do
    visit "/"
    user = FactoryGirl.create(:user)
    post = Post.create(:title => 'hole', :body => 'bob', :date => '2012-04-09 07:00:00')
    comment = Comment.create(:description => 'fingersmith', :post_id => post.id)
    visit post_path(post)
    page.first(:link, "Delete").click
    expect(page).to have_no_content 'fingersmith'
  end
end
