class MessageController < ApplicationController
  def receive
    @story = Story.last
    
    received_text = Received_text.new(params, @story)
    received_text.persist_if_acceptable
    
    if received_text.acceptable? && received_text.not_command?
      message = {:channel => "/receive", :data => received_text.content}
    else
      message = {:channel => "/receive", :data => ""}
    end
    
    sender = Sender.new(received_text, @story)
    sender.send_necessary_message

    # @story.lines.build(content: params["Body"], user: @user) unless params["Body"] == "PASS" || params["Body"] == "HELP"
    # last_line = @story.lines.last.content
    # @line = @story.lines.last

    # if params["Body"].match(/THE END$/)
    #   @story.end
    #   Story.create_new_story(next_user)
    # elsif params["Body"].match(/PASS$/)
    #   next_user = (User.all - [@user] - [User.first]).sample
    #   @story.request_next_line(last_line, next_user)
    # elsif params["Body"].match(/WTF$/)
    #   @story.help_message(@user)
    # else
    #   @story.request_next_line(last_line, next_user)
    # end
    
    # @story.save

    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)

  end
end