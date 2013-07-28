class MessageController < ApplicationController
  def receive

    @user = User.where(phone_number: params["From"]).first

    # @user.phone_number == params["From"]

    @story = Story.last
    
    next_user = (User.all - [@user] - [User.first]).sample
    
    # @story.next_user_id = next_user.id
    # @user == @story.next_user

    @story.lines.build(content: params["Body"], user: @user) unless params["Body"] == "PASS" || params["Body"] == "HELP"
    last_line = @story.lines.last.content

    if params["Body"].match(/THE END$/)
      @story.end
      Story.create_new_story(next_user)
    elsif params["Body"].match(/PASS$/)
      next_user = (User.all - [@user] - [User.first]).sample
      @story.request_next_line(last_line, next_user)
    elsif params["Body"].match(/WTF$/)
      @story.help_message(@user)
    else
      @story.request_next_line(last_line, next_user)
    end
      @story.save
  end
end


      # num_of_lines = @story.lines.count
      # next_phone_number = @story.next_user(num_of_lines).phone_number
      #Twilio call