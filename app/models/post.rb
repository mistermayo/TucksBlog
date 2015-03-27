class Post < ActiveRecord::Base
  validates :title, :body, :date, :presence => true
  has_many :comments
  belongs_to :user
end
