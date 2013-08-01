class TextSender

	def start_new_story
		new_story = Story.new
		new_story.lines.build(content: OpeningLine.random_line, user: User.first)
		new_story.next_user_id = @next_user.id
		new_story.save
		use_twilio(@next_user, new_story.lines.last.content)
	end

	def send_next_line
		find_next_user
		use_twilio(@next_user, @story.lines.last.content)
	end
	
	def use_twilio(user, text_to_send)
		Twilio::SMS.create :to => user.phone_number, :from => ENV["TWILIO_NUMBER"],
                     :body => text_to_send
	end
	
	def find_next_user
		@next_user = (User.all - [@received_text.user] - [User.first]).sample
		@story.next_user_id = @next_user.id
		@story.save
		WriteToSite.push_message(nil,nil,User.find(@story.next_user_id).name)
	end
	
	def send_command
		if @received_text.content.match(/PASS$/)
			if @received_text.story.next_user_id == @received_text.user.id
				find_next_user
				use_twilio(@next_user, @story.lines.last.content)
			else
				use_twilio(@received_text.user, "Wait your turn!")
			end
		elsif @received_text.content.match(/WTF$/)
			use_twilio(@received_text, "Continue the story! Or, you can type these commands: PASS to skip your turn. THE END to end current story")
		elsif @received_text.content.match(/STOP$/)
			if @received_text.story.next_user_id == @received_text.user.id
				find_next_user
				use_twilio(@next_user, @story.lines.last.content)
			end
			@received_text.user.delete
		end
	end
	
	def send_error
		if @received_text.user.nil?
			use_twilio(@received_text, "You're not signed up. Sign up via localhost: 3000")
		else
			use_twilio(@received_text.user, "Wait your turn!")
		end
	end

	def send_necessary_message(received_text, story)
		@received_text = received_text
		@story = story
		if @received_text.content.match(/THE END$/)
			find_next_user
			start_new_story
		elsif @received_text.command?
			send_command
		elsif @received_text.unacceptable?
			send_error
		else
			send_next_line
		end
	end
end