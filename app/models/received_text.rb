class Received_text
	attr_reader :phone_number, :content, :user
	def initialize(params, story)
		@phone_number = params["From"]
		@content = params["Body"]
		@user = User.where(phone_number: @phone_number).first
		@story = story
	end
	
	def acceptable?
		if @user.nil? || @user.id != @story.next_user_id then false else true end
	end
	
	def unacceptable?
		!acceptable?
	end
	
	def command?
		if @content.match(/PASS$/) || @content.match(/WTF$/) || @content.match(/STOP$/) then true else false end
	end

	def not_command?
		!command?
	end

	def persist_and_write_if_acceptable
		if acceptable? && not_command?
			@story.lines.create(content: @content, user: @user)
	    WriteToSite.push_message(@content, @user.name, nil)
		end
	end
end