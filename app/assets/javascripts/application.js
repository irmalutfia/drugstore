// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

window.animateNotification = function (){
  $("#notifications .notice").hide().fadeIn(200);
  $("#notifications .alert").hide().fadeIn(200);
  $("#notifications .notice").delay(5000).fadeOut(500);
  $("#notifications .alert").delay(5500).fadeOut(500);
}

function loadingNotification(type,message){
  if (message === "undefined") {
    message = ""
  }

  if (type === "show") {
    $(".loading-backdrop").show();
  }
  else if (type === "hide"){
    $(".loading-backdrop").hide();
  }
  $(".loading-message-block").find(".loading-message").html(message);
}

var ready;
ready = function() {
  animateNotification();

  $('body').on("ajax:beforeSend", 'a[data-show-loading]', function(e, xhr, settings) {
    return loadingNotification("show", "Loading...");
  });
  $('body').on("ajax:complete", 'a[data-show-loading]', function(e, data, status, xhr) {
   return loadingNotification("hide");
  });

};
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:fetch', function(){
  loadingNotification("show","Loading...");
});
$(document).on('page:change', function(){
  loadingNotification("hide");
});
