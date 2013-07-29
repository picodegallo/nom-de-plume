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
		if @content.match(/THE END$/) || @content.match(/PASS$/) || @content.match(/WTF$/)
			true
		else
			false
		end
	end

	def not_command?
		!command?
	end

	def persist_if_acceptable
		if acceptable? && !command?
			@story.lines.create(content: @content, user: @user)
		end
	end
end