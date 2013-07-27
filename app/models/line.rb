class Line < ActiveRecord::Base
  attr_accessible :content, :user
  belongs_to :story
  belongs_to :user

  def self.random_opening_line
    [
      "He had the urge to look out and see nothing",
      "She kept checking her phone",
      "She was carried along by the crowd"
    ].sample
  end

end
