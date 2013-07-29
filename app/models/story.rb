class Story < ActiveRecord::Base
  attr_accessible :next_user_id
  has_many :lines
  has_many :users, :through => :lines

  # def request_next_line(line, next_user)
  #   Twilio::SMS.create :to => next_user.phone_number, :from => ENV["TWILIO_NUMBER"],
  #                    :body => "Please continue this story: #{line}"
  # end

  # def help_message(user)
  #   Twilio::SMS.create :to => user.phone_number, :from => ENV["TWILIO_NUMBER"],
  #                    :body => "Continue the story! Or, you can type these commands: PASS to skip your turn. THE END to end current story"
  # end

  # def end
  #   self.ended_at = Time.now  # does this work?
  # end

  # def self.create_new_story(next_user)
  #   @new_story = self.create   # How do we text someone a new line? good question
  #   first_line = Line.random_opening_line
  #   @new_story.lines.create(content: first_line, user: User.find(1))
  #   @new_story.request_next_line(first_line, next_user)
  # end

end