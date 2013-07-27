class User < ActiveRecord::Base
  attr_accessible :name, :phone_number, :email
  has_many :stories, :through => :user_stories
  has_many :user_stories
  has_many :lines, :through => :stories
end
