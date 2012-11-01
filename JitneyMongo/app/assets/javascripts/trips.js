

$(function(){
	initializeMap();
});

function initializeMap() {
    var mapOptions = {
          center: new google.maps.LatLng(41.8500, -87.6500),
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
		var drawingManager = new google.maps.drawing.DrawingManager({
		  drawingMode: google.maps.drawing.OverlayType.MARKER,
		  drawingControl: true,
		  drawingControlOptions: {
		    position: google.maps.ControlPosition.TOP_CENTER,
		    drawingModes: [

		      google.maps.drawing.OverlayType.POLYGON
		    ]}}
		);
		drawingManager.setMap(map);
		/*
		google.maps.event.addListener(rectangle, 'bounds_changed', function() {
			bounds = rectangle.getBounds();
		  	console.log('Vertex removed from inner path.');
			console.log(bounds)
		});
		*/
		google.maps.event.addListener(map, 'mousedown', function(e){
			console.log(e.LatLng)
		});

        google.maps.event.addListener(drawingManager, 'overlaycomplete', function(event) {
            function extractCoordinatesThatDefineServiceArea() {
                return event.overlay.latLngs.b[0].b;
            }

            extractCoordinatesThatDefineServiceArea().forEach(
                function(point){console.log(point.Za + " " + point.Ya);});
        });
}

