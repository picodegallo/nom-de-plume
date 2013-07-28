class User < ActiveRecord::Base
  # include ActiveModel::Validations
  attr_accessible :name, :phone_number, :password, :password_confirmation, :email
  has_many :stories, :through => :user_stories
  has_many :user_stories
  has_many :lines, :through => :stories

  validates_presence_of :name, :password, :email, :phone_number
  validates_uniqueness_of :email, :phone_number
  validates :phone_number, :format => { :with => /\+\d{11}/, :on => :create, :message => "is invalid. Please include the area code" }
  # add message if validate fails
  before_validation(:on => :create) do
    num = phone_number.gsub(/\D/, '')
    num.prepend("1") unless num.length == 11
    self.phone_number = num.prepend("+")
  end



  #http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password

end
