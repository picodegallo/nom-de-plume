class MessageController < ApplicationController
  def receive
    @story = Story.last
    
    received_text = Received_text.new(params, @story)
    received_text.persist_and_write_if_acceptable
    
    sender = Sender.new(received_text, @story)
    sender.send_necessary_message

    # if received_text.acceptable? && received_text.not_command?
    #   message = {:channel => "/receive", :data => received_text.content}
    # else
    #   message = {:channel => "/receive", :data => ""}
    # end

    # uri = URI.parse("http://localhost:9292/faye")
    # Net::HTTP.post_form(uri, :message => message.to_json)

  end
end