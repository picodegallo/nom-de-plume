module ApplicationHelper
  def title
    "Nom de Plume"
  end

  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

  def message_push(content, author)
    Net::HTTP.post_form(URI.parse("http://localhost:9292/faye"), :message => {:channel => "/receive", :data => {:content => content, :author => author}}.to_json)
  end
  
end
