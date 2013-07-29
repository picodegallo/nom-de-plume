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

    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)

  end
end