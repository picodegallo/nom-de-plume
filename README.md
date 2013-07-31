# nom de plume

## starting server:

* rails s
* rackup faye.ru -s thin -E production
* localtunnel 3000
* copy the localtunnel URL into twilio

## need to test

* test that the STOP logic works
    * some way to delete your account
        * delete me button on user show page should work
        * and only show to the right person
        * and not anyone should be able to send a delete request and delete any user

## TODOS

* figure out deploying
    * in production will errors be displayed?
    * like, not that there will be errors
* meta
    * move phone numbers to application.yml
    * add an about page
* make a note in gallery when stuff ended
* align forms for kristen

## DONE

* give list of commands at registration
* if some rando texts in, reject it
* text PASS to pass your turn
* add instructions on how to start our application to this readme
* remove phone number column from line
* user user_story table
* make a speaker deck
