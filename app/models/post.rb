class Post < ActiveRecord::Base
  validates :title, :body, :date, :presence => true
  has_many :comments

end
