$(document).ready(function() {
  getMessages();
});

var getMessages = function() {

  $.get('getMessages', function(data) {
    console.log('get lefutott');
    setTimeout(getMessages, 2500);
  });
};
