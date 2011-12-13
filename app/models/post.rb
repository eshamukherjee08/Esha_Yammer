class Post < ActiveRecord::Base
  
  belongs_to :user
  validates :content, :presence => true
  
  acts_as_commentable
end
