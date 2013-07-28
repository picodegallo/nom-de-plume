class User < ActiveRecord::Base
  attr_accessible :name, :phone_number, :password, :password_confirmation, :email
  has_many :stories, :through => :user_stories
  has_many :user_stories
  has_many :lines, :through => :stories

  validates_presence_of :name, :password, :email, :phone_number
  validates_uniqueness_of :email, :phone_number

  #http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password
end
