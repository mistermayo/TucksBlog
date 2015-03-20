class Post < ActiveRecord::Base
  validates :title, :description, :presence => true
  has_many :comments

end
