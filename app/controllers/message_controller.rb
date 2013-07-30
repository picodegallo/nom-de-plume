class MessageController < ApplicationController
  def receive
    @story = Story.last
    
    received_text = Received_text.new(params, @story)
    received_text.persist_and_write_if_acceptable
    
    TextSender.send_necessary_message(received_text, @story)
    
  end
end