$(function() {

	$('.home_page_form').submit(function(){
		if($('#search_box').val()==""){
			return false;		
		}
	});

	//over the input
        $( "input[type='text'],input[type='password'],textarea" ).mouseover(function(){
			if(!$(this).is(":focus")){
                                $(this).css("border-color","#8C8C8C"); 
			}
                }).mouseout(function(){
			if(!$(this).is(":focus")){
                 	       $(this).css("border-color","#b8bdc2");
			}
                }).focus(function(){
                                $(this).css("border-color","#F6A828"); 
                }).blur(function(){
                        $(this).css("border-color","#b8bdc2"); 
        }); 

/*
	var availableTags = [
	"ActionScript",
	"AppleScript",
	"Asp",
	"BASIC",
	"C",
	"JavaScript",
	"Lisp",
	"Perl",
	"PHP",
	"Python",
	"Ruby",
	"Scala",
	"Scheme"
	];

	$( ".radientBG #search_box" ).autocomplete({
		source: availableTags
	}).focus();

*/

	//home page, click label
	$( "#l_All" ).click(function() {
		$( "#search_radio_All" ).prop( "checked", true );
	});
	$( "#l_Title" ).click(function() {
		$( "#search_radio_Title" ).prop( "checked", true );
	});
	$( "#l_Company" ).click(function() {
		$( "#search_radio_Company" ).prop( "checked", true );
	});
	$( "#l_Location" ).click(function() {
		$( "#search_radio_Location" ).prop( "checked", true );
	});


});

