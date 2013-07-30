class WriteToSite
	def self.push_message(content, author, next_user)
    uri = URI.parse("http://localhost:9292/faye")
    data = {:content => content, :author => author, :next_user => next_user}
    message = {:channel => "/receive", :data => data}
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end