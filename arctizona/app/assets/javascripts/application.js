//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var editProfile = function() {

  $('#edit-profile').click(function() {
    $('#profile-form').show(300);
    $('#close-profile').show();
    $('#edit-profile').hide();
  });

  $('#close-profile').click(function() {
    $('#profile-form').hide(300);
    $('#close-profile').hide();
    $('#edit-profile').show();
  });

};

$(document).ready(editProfile);
$(document).on('turbolinks:load', editProfile);