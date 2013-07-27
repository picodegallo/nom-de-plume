class MessageController < ApplicationController
  def receive
    @user = User.where(phone_number: params["From"]).first
    
    puts params.inspect
    puts @user.inspect
    # raise @user.inspect
    # Sms.create(body: params["Body"], from_num: params["From"])
  end
end
