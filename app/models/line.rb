class Line < ActiveRecord::Base
  attr_accessible :content, :user
  belongs_to :story
  belongs_to :user

  def self.random_opening_line
    [
      "He had the urge to look out and see nothing",
      "She kept checking her phone",
      "She was carried along by the crowd"
    ].sample
  end

  # this so doesn't belong ehre I'm so sorry
  def self.message_push(content, author)
    uri = URI.parse("http://localhost:9292/faye")
    data = {:content => content, :author => author}
    message = {:channel => "/receive", :data => data}
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
