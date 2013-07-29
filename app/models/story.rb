class Story < ActiveRecord::Base
  attr_accessible :next_user_id
  has_many :lines
  has_many :users, :through => :lines

end