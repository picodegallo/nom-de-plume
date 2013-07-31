OpeningLine.create(content: "He had the urge to look out and see nothing")
OpeningLine.create(content: "She kept checking her phone")
OpeningLine.create(content: "She was carried along by the crowd")

plume = User.create(
  :name => "Admin",
  :email => "nomdeplume@flatironschool.com",
  :password => "12345",
  :password_confirmation => "12345",
  :phone_number => "555 555 5555"
  )

# rlstine = User.create(
#   :name => "RL Stine",
#   :email => "rlstine@flatironschool.com",
#   :password =>'12345',
#   :password_confirmation => '12345',
#   :phone_number => "+16176407951"
#   )

# rlstine_goog = User.create(
#   :name => "RL Stine2",
#   :email => "rlstine2@flatironschool.com",
#   :password =>'12345',
#   :password_confirmation => '12345',
#   :phone_number => "+19739785064"
#   )

jonathan = User.create(
  name: "Jonathan Franzen",
  phone_number: "+19144171895",
  email: "franzen@flatironschool.com",
  password: "12345",
  password_confirmation: "12345"
  )

ernest = User.create(
  name: "Hemingway",
  phone_number: "+15035377883",
  email: "hemingway@flatironschool.com",
  password: "12345",
  password_confirmation: "12345"
  )

simone = User.create(
  name: "Simone de Beauvoir",
  phone_number: "+13307036872",
  email: "simone@flatironschool.com",
  password: "12345",
  password_confirmation: "12345"
  )

# seed data with stories and lines
11.times do 
  Story.create
end

lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."

Story.all.each do |story|
  story.lines.create(content: lorem, user: User.all.sample)
end

story = Story.new
story.lines.build(content: OpeningLine.all.sample, user: plume)
story.next_user_id = 3
story.save
# Twilio::SMS.create :to => ernest.phone_number, :from => ENV["TWILIO_NUMBER"],
#                  :body => story.lines.first.content
