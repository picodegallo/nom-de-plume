# Nom de Plume

Nom de Plume is an anonymous, collaborative storytelling platform.

It's live and playable at <http://address_goes_here.com>. This is the source code.

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
```

* `rails s` to start the server
* `localtunnel 3000` to expose the rails app publicly
* `rackup faye.ru -s thin -E production`

## TODOS

* Faye integration
* Deactive a user 
* meta
    * move phone numbers to application.yml
    * add an about page
* make a note in gallery when stuff ended
