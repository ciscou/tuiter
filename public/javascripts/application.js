// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function () {
  if($('#tuits').length > 0) {
    setTimeout(updateTuits, 5000);
  }
});

function updateTuits() {
  var username = $('#tuits').attr('data-username');
  if ($('.tuit').length > 0) {
    var after = $('.tuit:first').attr('data-time');
  } else {
    var after = 0;
  }

  $.getScript((username ? '/users/' + username : '') + '/tuits.js?after=' + after);
  setTimeout(updateTuits, 5000);
}
