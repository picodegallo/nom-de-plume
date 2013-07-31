class MessageController < ApplicationController
  def receive
    @story = Story.last
    
    received_text = Received_text.new(params, @story)
    received_text.persist_and_write_if_acceptable
    
    text_sender = TextSender.new
    text_sender.send_necessary_message(received_text, @story)
    
  end
end