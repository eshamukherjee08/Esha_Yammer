class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :invitable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :name, :avatar
  
  has_attached_file :avatar, :styles => { :thumb=> "100x100" }, :default_url => "default.jpg"
  validates_attachment_content_type :avatar, :content_type=>['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :avatar, :less_than => 8.megabytes
  validates :name, :presence=>true, :length => {:minimum => 3}
  
  has_many :posts, :dependent => :destroy
  
  has_many :followings, :class_name => "Follower", :foreign_key => "follower_id"
  has_many :followers, :through => :followings, :source => "followee"
  
  
  has_many :followed_by, :class_name => "Follower", :foreign_key => "followee_id"  
  has_many :followees, :through => :followed_by, :source => "follower"
  
  #validates :email, :format => { :with =>  /^[a-zA-Z0-9._-]+@vinsol.com$/ }, :uniqueness => true
  
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    unless_confirmed {yield}
  end
  
  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end
  
  
end
