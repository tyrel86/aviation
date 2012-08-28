$(window).bind("load", function() {
  $("#airport").click( function() {
    var airportname = $('#airportinput')[0].value;
    var uri = "http://flightaware.com/live/airport_status_bigmap.rvt?airport=" + airportname;
    window.open(uri,'mywindow','width=1200,height=580');
  });
});

$(window).bind("load", function() {
  $("#flightmap").click( function() {
    var tailnumber = $('#flightmapinput')[0].value;
    var uri = "http://flightaware.com/live/flight/" + tailnumber;
    window.open(uri,'mywindow','width=1200,height=580');
  });
});
