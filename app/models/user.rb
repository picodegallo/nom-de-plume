class User < ActiveRecord::Base

  attr_accessible :name, :phone_number, :password, :password_confirmation, :email
  has_many :lines
  has_many :stories, :through => :lines

  validates_presence_of :name, :password, :email, :phone_number
  validates_uniqueness_of :email, :phone_number
  validates :phone_number, :format => { :with => /\+\d{11}/, :on => :create, :message => "is invalid. Please include the area code" }
  validates :email,        :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :on => :create}
  
  before_validation(:on => :create) do
    num = phone_number.gsub(/\D/, '')
    num.prepend("1") unless num.length == 11
    self.phone_number = num.prepend("+")
  end



  #http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password

end
