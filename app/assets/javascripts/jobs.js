$(function() {
	//over the input
        $( "input[type='text'],input[type='password']" ).mouseover(function(){
			if(!$(this).is(":focus")){
                                $(this).css("border-color","#a3a3a3"); 
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
	$( "#search_box" ).autocomplete({
		source: availableTags
	}).focus();




});

