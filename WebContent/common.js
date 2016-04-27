$(document).ready(function() {
	var oldData;
    getMessages(oldData);
});

var getMessages = function(oldData) {
  $.ajax({
	    type        :   'GET',
	    url         :   'getMessages', 
	    dataType    :   'json',
	    complete    :   function(data) {
	    	var str = '[' + data['responseText'] + ']';
	    	str = str.replace(/\}/g, '},');
	    	str = str.replace('},]', '}]');
	    	str = $.parseJSON(str);
	    	if(typeof(oldData)===undefined){
	    		oldData = str;
	    	}
	    	if(oldData !== str){
	    		$('#messages tbody').html('');
	    		
		    	$.each(str, function(key, value) {
		    		$('#messages tbody').append(
		    			'<tr><td>'+value.user+'</td>' + 
		    			'<td>'+value.message+'</td></tr>'
		    		);
		    	});
	    	}
	        setTimeout(getMessages, 2500);
	    }
	});
};
