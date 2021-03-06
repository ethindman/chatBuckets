// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dragula
//= require materialize

$(document).ready(function() {
  dragula([document.querySelector('#dragula-items-wrapper')]);
});

$(document).ready(function() {
  setTimeout(function() {
    $('.alert-box').slideUp('slow', function() {
      $(this).remove();
    });
  }, 2000);
});

// Initialize modals
$(document).ready(function(){
  $('.modal').modal();
});
