class Story < ActiveRecord::Base
  has_many :lines
  has_many :user_stories
  has_many :users, :through => :user_stories

  def next_user(num_of_lines)
  	if num_of_lines == 0 || num_of_lines == self.users.count
  		next_user = self.users.sample
  	else
  		remaining_users = (User.all - self.users)
  		next_user = remaining_users.sample
  end
end

# def last_user
# 	[self.lines.last.user]
# end