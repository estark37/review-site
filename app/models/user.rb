class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :snippets, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  private
  
  def create_remember_token
    self.remember_token = SecureRandom.hex
  end
end
