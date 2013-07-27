class Line < ActiveRecord::Base
  attr_accessible :content, :user
  belongs_to :story
  belongs_to :user
end
