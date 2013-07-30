# jquery extension to attach these listeners
# the @ is just a shorthand for "this"
$.fn.highlightLine = ->
  $(@).on "mouseenter", ->
    $(@).css "color", "green"
  $(@).on "mouseleave", ->
    $(@).css "color", "black"

# in case you forget what language you're writing in and do puts instead of console.log
puts = (whatever) -> console.log whatever

# on document ready call this function
$ ->
  # attach these things to all of the lines already on the page
  $(".line").tooltip()
  $(".line").highlightLine()

  # setup faye
  faye = new Faye.Client "http://localhost:9292/faye"
  faye.subscribe "/receive", (data) ->
    # this function is called whenever a message is sent to the front end
    # let's just output it to see what it looks like
    puts "data object from websocket looks like..."
    puts data

    # if the data object has a key called "content"...
    if data.content?
      # refresh page if the content ends with THE END
      location.reload() if /THE END$/.test data.content
      # we assume it also has a key called author
      # and that we should append them to the first story
      $("<span class='line' data-toggle='tooltip' title='Written by #{data.author}'>#{data.content}</span>")
            .appendTo(".story-inner:first")
      # we need to attach our listeners to the newly-appended lines
      $('.line').tooltip()
      $('.line').highlightLine()
    # if the data object includes a next_user key
    # (which it doesn't always include)
    # update the next_user span with that new piece of data
    if data.next_user?
      $("#next_user").text data.next_user
