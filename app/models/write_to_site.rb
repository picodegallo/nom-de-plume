class WriteToSite
	def self.push_message(content, author, next_user)
    uri = URI.parse("http://192.241.168.144:9292/faye.js")
    data = {:content => content, :author => author, :next_user => next_user}
    message = {:channel => "/receive", :data => data}
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end