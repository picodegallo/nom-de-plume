class MessageController < ApplicationController
  def receive
    @user = User.where(phone_number: params["From"]).first


    @story = Story.last
    @story.lines.build(content: params["Body"], user: @user)
    @story.save
    if params["Body"].match(/THE END$/)
      Story.create #How do we text someone a new line? good question
    end
  end
end
