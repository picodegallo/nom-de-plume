class MessageController < ApplicationController
  def receive
    
    @user = User.where(phone_number: params["From"]).first

    Twilio::SMS.create :to => params["From"], :from => ENV["TWILIO_NUMBER"],
                       :body => "Thanks for participating"

    # TODO if some rando texts in, reject it


    @story = Story.last
    @story.lines.build(content: params["Body"], user: @user)    
    if params["Body"].match(/THE END$/)
      @story.ended_at = Time.now  # does this work?
      @new_story = Story.create   # How do we text someone a new line? good question
      first_line = Line.random_opening_line
      @new_story.lines.build(content: first_line, user: User.find(1))
      @new_story.save

      # we need to pick a random user to write the nxt line
      # txt them first_line
      # ask for a response
      Story.create #How do we text someone a new line? good question
    else
    	next_phone_number = next_user(@story.lines.count, @story).phone_number
    	#Twilio call
    end
    @story.save
  end
end
