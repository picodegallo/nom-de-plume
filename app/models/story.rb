class Story < ActiveRecord::Base
  #attr_accessible 
  has_many :lines
  has_many :user_stories
  has_many :users, :through => :user_stories
end
