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
    $(".wrapper").removeClass("blur");
  });

};

$(document).ready(editProfile);
$(document).on('turbolinks:load', editProfile);