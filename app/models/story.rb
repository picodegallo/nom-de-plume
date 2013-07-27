class Story < ActiveRecord::Base
  has_many :lines
  # has_many :user_stories
  # has_many :users, :through => :user_stories
  has_many :users, :through => :lines
end
