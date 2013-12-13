$(document).ready(function(){

	var notice = $(this).find("#notice");
	if(notice){
		setTimeout(function() {
		      notice.slideUp(500);
		}, 5000);
	}

	$('iframe').height('500');
			
				// Hide loading image when iframe is loaded
	var method = $('iframe').load(function() {	


		//hide the .account inside,but when javascript disable, it will show again.
		$('iframe').contents().find(".accountLoggedin").hide();
		
		//location of the panel
		$('iframe').contents().find(".panel_form,.my_profile,.my_new_job,.my_joblist,.emailus_selt,.edit_my_account,.update_my_profile,#my_joblist").css({"margin": "0", "padding": "10px 0 0 50px"});

		//fix the css of flash
		$('iframe').contents().find("#notice").css({"margin-left": "50px"});

	  	$(this).fadeIn(500);

		var h1=$('body', $('iframe').contents()).height()+50;
		var h2=$('body', $('#panel_div')).height();
		if(h1>500)
		{
			$('iframe').height(h1);
			$('#panel_div').height(h1+150);
		}
		else
		{	
			$('iframe').height(500);
			$('#panel_div').height(750);

		}

	});
/////////////////////////
 
	$('#leftPanelList').delegate('li a', 'click', function(event) {

			var href = self.attr('href');


				$('iframe').fadeOut(500).attr('src', function() {
					
					return href;
				});

		event.preventDefault();
	});

 
	$('.services').click(); 

	
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
