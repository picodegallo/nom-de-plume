plume = User.create(
  :name => "Admin",
  :email => "nomdeplume@flatironschool.com",
  :password => "12345",
  :password_confirmation => "12345",
  :phone_number => "555 555 5555"
  )

rlstine = User.create(
  :name => "RL Stine",
  :email => "rlstine@flatironschool.com",
  :password =>'12345',
  :password_confirmation => '12345',
  :phone_number => "+16176407951"
  )

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

story = Story.new
story.lines.build(content: Line.random_opening_line, user: ernest)
story.save
