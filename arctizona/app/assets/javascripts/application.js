//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var editProfile = function() {

  $('#edit-profile').click(function() {
    $('#profile-form').show(300);
    $('#close-profile').show();
    $('#edit-profile').hide();
    $('#back').show();
    $(".wrapper").addClass("blur");
  });

  $('#close-profile').click(function() {
    $('#profile-form').hide(300);
    $('#close-profile').hide();
    $('#edit-profile').show();
    $('#back').hide();
    $(".wrapper").removeClass("blur");
  });

  $('#back').click(function() {
    $('#profile-form').hide(300);
    $('#close-profile').hide();
    $('#edit-profile').show();
    $('#back').hide();
    $(".wrapper").removeClass("blur");
  });

  $('#close').click(function() {
    $('#profile-form').hide(300);
    $('#close-profile').hide();
    $('#edit-profile').show();
    $('#back').hide();
    $('.wrapper').removeClass('blur');
  });

};

$(document).ready(editProfile);
$(document).on('turbolinks:load', editProfile);


var userTabs = function() {

  $('#albums-tab').click(function() {
    $('#albums-container').show(300);
    $('#feed-container').hide();
    $('#albums-tab').css("background-color", "#ccc");
    $('#feed-tab').css("background-color", "#f4f4f4");
  });

  $('#feed-tab').click(function() {
    $('#albums-container').hide(300);
    $('#feed-container').show();
    $('#feed-tab').css("background-color", "#ccc");
    $('#albums-tab').css("background-color", "#f4f4f4");
  });

};

$(document).ready(userTabs);
$(document).on('turbolinks:load', userTabs);



