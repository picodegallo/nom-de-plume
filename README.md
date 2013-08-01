# TODOS

* add an about page
* with "fork me on github" link to this repo
* make a note in gallery when stuff ended
* delete the TODOs from this README

# Nom de Plume

Nom de Plume is an anonymous, collaborative storytelling platform.

It's live and playable at <http://192.241.168.144/>. This is the source code.

One featured story at a time:

![](http://d.pr/i/WoWy+)

A gallery of previous stories:

![](http://d.pr/i/BNQ6+)

If you want to try running it, here are the many many steps:

* clone the repo
* `bundle install` to get the dependencies for the rails app
* `gem install faye localtunnel thin` to get the remaining dependencies (overkill?)
* register with twilio and get your phone number, SID, and token
* create a file at `config/application.yml` with that information, which looks like this:

```yml
TWILIO_SID: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
TWILIO_TOKEN: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
TWILIO_NUMBER: "+15555555555"
PERSONAL_NUMBER: "+15555555554"
```

* create a file at `config/database.yml` with the standard rails 3.2.13 contents (it's not in our repo because ours is customized for deployment):

```yml
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000
```

* `rake db:migrate` to setup your database
* `rake db:seed` to seed your database, which...
    * creates a bunch of random opening lines
    * creates an admin user
    * creates a participant user
    * creates a first story with a random opening line
    * chooses you to continue the story
    * sends you a text message
* `rails s` to start the server
* `localtunnel 3000` to expose the rails app publicly
* visit the [twilio manage numbers](https://www.twilio.com/user/account/phone-numbers/incoming) page, choose your number, and change the SMS request URL to `<whatever your localtunnel address is>/receive`
* `rackup faye.ru -s thin -E production` to start your faye server
* visit it at <http://localhost:3000>

You should see the first line of your story and be able to text in a message.

## Made by

* Sagar - [twitter](http://twitter.com/sgrshah) / [github](http://github.com/sgrshah)
* Sarah - [twitter](http://twitter.com/sarah_duve) / [github](http://github.com/sarahduve)
* Kristen - [twitter](http://twitter.com/picodegallo) / [github](http://github.com/picodegallo)
* Max -  [twitter](http://twitter.com/maxjacobson) / [github](http://github.com/maxjacobson)

At The Flatiron School [twitter](http://twitter.com/flatironschool) / [github](http://github.com/flatiron-school)
