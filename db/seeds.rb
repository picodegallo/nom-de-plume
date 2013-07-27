sagar = User.create(
  :name => "Sagar",
  :email => "sgrshah@gmail.com",
  :password =>'12345',
  :password_confirmation => '12345'
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
story.lines.build(content: "Once upon a time...", user: ernest)
story.save
