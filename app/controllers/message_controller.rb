class MessageController < ApplicationController
  def receive
    @user = User.where(phone_number: params["From"]).first


    @story = Story.last
    @story.lines.build(content: params["Body"], user: @user)
    @story.save
    if params["Body"].match(/THE END$/)
      Story.create #How do we text someone a new line? good question
    else
    	num_of_lines = @story.lines.count
    	next_phone_number = @story.next_user(num_of_lines).phone_number
    	#Twilio call
    end
  end
end
