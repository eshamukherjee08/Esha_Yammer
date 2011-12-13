class Post < ActiveRecord::Base
  
  belongs_to :user
  validates :content, :presence => true
  attr_accessible :post_pic, :content, :user_id
  
  has_attached_file :post_pic, :styles => { :thumb=> "100x100" }, :default_url => "default.jpg"
  validates_attachment_content_type :post_pic, :content_type=>['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :post_pic, :less_than => 8.megabytes
  
  
  acts_as_commentable
end
