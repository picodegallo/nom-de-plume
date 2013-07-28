# nom de plume

## TODOS

* type HELP for a list of commands
* give list of commands at registration
* if some rando texts in, reject it
* text STOP to delete your account
* text PASS to pass your turn
* move phone numbers to application.yml
* add a typewriter to the site with animations when a new message comes in
* i made bootstrap.css filename `bootstrap3.css` because idk how to explain it wouldnt work otherwise the previous version was cached or something? idk





pseudo code:

- start both the rails server and the websocket server
- open the site, make sure the websocket handshake takes place
- in rails: require typhoeus
- when a new text comes in, write it to the database
- and *also* make an http get request to the ws server
- will that be read as a "message" ?
- if so, we can have it act on that message and forward the request thru the tube sock into the front end...