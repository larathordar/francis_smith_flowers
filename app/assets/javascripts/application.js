// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).ready(function() {
  $("#link1").click(function() {
      $('html, body').animate({
          scrollTop: $("#anchor1").offset().top
      }, 8000);
  });
  $("#link1").click(function() {
      $('html, body').animate({
          scrollTop: $("#anchor1").offset().top
      }, 8000);
  });
  $("#link2").click(function() {
        $('html, body').animate({
            scrollTop: $("#repeatPrescription").offset().top
        }, 8000);
  });
  $("#link3").click(function() {
        $('html, body').animate({
            scrollTop: $("#instagram").offset().top
        }, 8000);
  });
  $("#link4").click(function() {
        $('html, body').animate({
            scrollTop: $("#instagram").offset().top
        }, 8000);
  });
});
