class Story < ActiveRecord::Base
  has_many :lines
  # has_many :user_stories
  # has_many :users, :through => :user_stories
  has_many :users, :through => :lines
end

def next_user(num_of_lines, story)
	if num_of_lines == 0 || num_of_lines == story.users.count
		next_user = story.users.sample
	else
		remaining_users = (User.all - story.users)
		next_user = remaining_users.sample
end

# def last_user
# 	[self.lines.last.user]
# end
