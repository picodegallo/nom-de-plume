class OpeningLine < ActiveRecord::Base
  attr_accessible :content
  def self.random_line
    self.all.sample.content
  end
end
