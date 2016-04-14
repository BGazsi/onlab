$(document).ready(function() {
  getMessages();
});

var getMessages = function() {
	console.log('lofasz');
  $.get('getMessages', function(data) {
    console.log(data);
  })
};
