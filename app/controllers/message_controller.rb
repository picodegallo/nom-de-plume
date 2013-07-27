class MessageController < ApplicationController
  def receive
    
    @user = User.where(phone_number: params["From"]).first
    next_user = (User.all - [@user] - [User.first]).sample
    puts next_user.inspect

    # Twilio::SMS.create :to => params["From"], :from => ENV["TWILIO_NUMBER"],
    #                    :body => "Thanks for participating"

    @story = Story.last
    @story.lines.build(content: params["Body"], user: @user)    
    if params["Body"].match(/THE END$/)
      @story.ended_at = Time.now  # does this work?
      @new_story = Story.create   # How do we text someone a new line? good question
      first_line = Line.random_opening_line
      @new_story.lines.build(content: first_line, user: User.find(1))
      @new_story.save

      Twilio::SMS.create :to => next_user.phone_number, :from => ENV["TWILIO_NUMBER"],
                         :body => "Please continue this story: #{first_line}"
      Story.create
    else

      Twilio::SMS.create :to => next_user.phone_number, :from => ENV["TWILIO_NUMBER"],
                         :body => "Please continue this story: #{params['Body']}"

    	# num_of_lines = @story.lines.count
    	# next_phone_number = @story.next_user(num_of_lines).phone_number
    	#Twilio call
    end
    
    @story.save
  end
end
