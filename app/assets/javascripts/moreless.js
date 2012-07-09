$(document).ready( function() {
	$('.more-less').click( function() {
		var lis = $(this).closest('ul').find('li')
		if( lis.size() > 7 ) {
			var lis_over_seven = lis.slice(7,lis.size())
			lis_over_seven.each( function() {
				$(this).toggleClass( "hide" )
			})
		}
		$(this).html() == "more" ? $(this).html("less") : $(this).html("more") 
	})
})
