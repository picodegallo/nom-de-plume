// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./../../../vendor/assets/javascripts
//= require_tree .

$.fn.highlightLine = function() {
  $(this).on("mouseenter", function() {
    $(this).css("color", "green");
  });
  $(this).on("mouseleave", function() {
    $(this).css("color", "black");
  });
};

$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/receive', function (data) {
    console.log("data object from websocket looks like...:");
    console.log(data);
    if (/THE END$/.test(data.content)) {
      location.reload();
    };
    if (typeof data.content !== "undefined" && data.content !== null) {
      $("<span class='line' data-toggle='tooltip' title='Written by "+ data.author +"' >" + data.content + "</span>").appendTo(".story-inner:first");
      $('.line').tooltip();
    $('.line').highlightLine();
    }
    if (typeof data.next_user !== "undefined" && data.next_user !== null) {
      $('#next_user').text(data.next_user);
    };
  });
  $('.line').tooltip();
  $('.line').highlightLine();
});
