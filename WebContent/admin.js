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
	    		$('#forms').html('');
	    		
		    	$.each(str, function(key, value) {
		    		$('#messages tbody').append(
		    			'<tr><td><input class="btn btn-danger" type="submit" value="Törlés" form="delete-' + value.id + '"></td>' + 
		    			'<td>'+value.user+'</td>' + 
		    			'<td>'+value.message+'</td></tr>'
		    		);
		    		$('#forms').append(
						'<form id="delete-' + value.id + '" style="display: none;" action="deleteMessage" method="post">' + 
							'<input type="text" name="id" value="' + value.id +'" />' + 
		  				'</form>');
		    	});
	    	}
	        setTimeout(getMessages, 2500);
	    }
	});
};
