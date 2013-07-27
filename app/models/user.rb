class User < ActiveRecord::Base
  attr_accessible :name, :phone_number, :password, :password_confirmation, :email
  has_many :stories, :through => :user_stories
  has_many :user_stories
  has_many :lines, :through => :stories

  #http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password
end
