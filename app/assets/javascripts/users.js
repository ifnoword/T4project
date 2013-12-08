$(document).ready(function(){
	

 					   
	$('#usermainCtn').height('580');
	$('#loading').height('500');
	$('iframe').height('500');
			
				// Hide loading image when iframe is loaded
	var method = $('iframe').load(function() {	
		//hide the .account inside,but when javascript disable, it will show again.
		$('iframe').contents().find(".accountLoggedin").hide()
		
		$(this).fadeIn(300);	  

		var h1=$('body', $('iframe').contents()).height()+50;
		var h3=0;
		if(h1>500)
		{
			h3=580+h1-500;
			$('iframe').height(h1);
		}
		else
		{	
			$('iframe').height('500');

		}
	});
/////////////////////////
 
	$('#leftPanelList').delegate('li a', 'click', function(event) {

		var self = $(this),
			i = self.parent().index(),
			href = self.attr('href');


			// Show loading icon
		//	$('#loading').fadeIn(100, function() {
				// Setup iframes
				$('iframe').fadeOut(200).attr('src', function() {
					
					return href;
				}).load(function() {method()});

		//	});
		// Don't follow the link
		event.preventDefault();
	});

 
	
});

function change(){
	var h1=$('body', $('iframe:visible').contents()).height()+30;
		var h3=0;
		if(h1>500)
		{
			h3=580+h1-500;
			$('iframe').height(h1);
			$('#usermainCtn').height(h3);
			$('#loading').height(h1);
		}
		else
		{	
			$('#usermainCtn').height('580');
			$('#loading').height('500');
			$('iframe').height('500');

		}
}
