class MessageController < ApplicationController
  def receive

    @user = User.where(phone_number: params["From"]).first
    @story = Story.last
    @story.lines.build(content: params["Body"], user: @user) unless params["Body"] == "PASS" || params["Body"] == "WTF" || @user.nil? || @user.out_of_turn?(@story)
    last_line = @story.lines.last.content

    if @user.nil?
      @story.sign_up_message(params["From"])
    elsif @user.out_of_turn?(@story)
      @story.out_of_turn_message
    elsif params["Body"].match(/THE END$/)
      @story.end
      next_user = (User.all - [@user] - [User.first]).sample
      Story.create_new_story(next_user) #also sets next_user_id
    elsif params["Body"].match(/PASS$/)
      next_user = (User.all - [@user] - [User.first]).sample
      @story.next_user_id = next_user.id
      @story.request_next_line(last_line, next_user)
    elsif params["Body"].match(/WTF$/)
      @story.help_message(@user)
    else
      next_user = (User.all - [@user] - [User.first]).sample
      @story.next_user_id = next_user.id      
      @story.request_next_line(last_line, next_user)
    end
      @story.save
  end
end
      # num_of_lines = @story.lines.count
      # next_phone_number = @story.next_user(num_of_lines).phone_number
      #Twilio call