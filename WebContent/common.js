$(document).ready(function() {
  getMessages();
});

var getMessages = function() {
  $.ajax({
	    type        :   'GET',
	    url         :   'getMessages', 
	    dataType    :   'json',
	    complete    :   function(data) {
	    	var str = '[' + data['responseText'] + ']';
	    	str = str.replace(/\}/g, '},');
	    	str = str.replace('},]', '}]');
	    	str = $.parseJSON(str);
    		$('#messages tbody').html('');
    		
	    	$.each(str, function(key, value) {
	    		$('#messages tbody').append(
	    			'<tr><td>'+value.user+'</td>' + 
	    			'<td>'+value.message+'</td></tr>'
	    		);
	    	});
	        setTimeout(getMessages, 2500);
	    }
	});
};
