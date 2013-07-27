jonathan = User.create(
  name: "Jonathan Franzen",
  phone_number: "+19144171895",
  email: "franzen@flatironschool.com"
  )

ernest = User.create(
  name: "Hemingway",
  phone_number: "+15035377883",
  email: "hemingway@flatironschool.com"
  )

simone = User.create(
  name: "Simone de Beauvoir",
  phone_number: "+13307036872",
  email: "simone@flatironschool.com"
  )

story = Story.new
line = Line.new
line.content = "Once upon a time..."
line.user = ernest
story.lines << line
story.save
