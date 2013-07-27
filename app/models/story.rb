class Story < ActiveRecord::Base
  has_many :lines
  has_many :users, :through => :lines

  # def next_user(num_of_lines)

  #   if num_of_lines == 0 || num_of_lines == self.users.count
  #     next_user = self.users.sample
  #   else
  #     remaining_users = (User.all - self.users)
  #     next_user = remaining_users.sample
  #   end
  # end

end
