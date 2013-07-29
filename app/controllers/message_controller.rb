class MessageController < ApplicationController
  def receive

    @user = User.where(phone_number: params["From"]).first

    @story = Story.last
    
    next_user = (User.all - [@user] - [User.first]).sample
    
    @story.lines.build(content: params["Body"], user: @user) unless params["Body"] == "PASS" || params["Body"] == "HELP"
    last_line = @story.lines.last.content
    @line = @story.lines.last

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

    Line.message_push(@line.content, @user.name)

  end
end