<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>

<style>
html, body {
	height: 100%
}

.map {
	height: 300px;
}

.btn {
	background-color: rgba(10, 10, 230, .5);
	border: 0;
	color: #fff;
	padding: 10px;
	text-shadow: 0 0 1px rgba(0, 0, 0, .3);
	text-decoration: none;
	margin: 0.5rem 0 1rem;
	display: inline-block;
}
</style>


<script>
	map = null;
	function getLocation() {

		if (!navigator.geolocation) {
			alert("Browser doesn't support geolocation");
		} else {
			navigator.geolocation.getCurrentPosition(success, error);
		}
	}

	// Get current position successfully
	function success(position) {
		var marker, latitude = position.coords.latitude, longitude = position.coords.longitude;
		getOwnerDetails(latitude, longitude)

		// Instance map using leaflet
		map = L.map('map').setView([ latitude, longitude ], 13);

		// Tile layer using key api at cloudmade.com
		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
			key : '760506895e284217a7442ce2efe97797',
			styleId : 103288,
			maxZoom : 16
		}).addTo(map);
		var century21icon = L.icon({
		    //iconUrl: 'https://i.ibb.co/sJrMTdz/favicon-32x32.png',
		    iconUrl: '/images/pic1.png',
		    
		    iconSize: [20, 20]
		    });
		// Marker using leaflet
		marker = L.marker([ latitude, longitude ], {
			icon: century21icon,
			draggable : 'true'
		}).addTo(map);

		//Drag Marker
		marker.on('dragend', function(event) {
			var position = marker.getLatLng();
			marker.setLatLng(position, {
				draggable : 'true'
			}).bindPopup(position).update();
			$("#lat").val(position.lat.toFixed(5));
			$("#lon").val(position.lng.toFixed(5)).keyup();
		});

		// Popup in leaflet
		marker.bindPopup('<p>Your location</p>').openPopup();
		$("#lat").val(latitude.toFixed(5));
		$("#lon").val(longitude.toFixed(5))
	}

	// Get current position fail
	function error() {
		alert('Get current position fail.');
	}

	//ajax code

	function getOwnerDetails(latitude, longitude) {
		alert(latitude+" "+longitude)

		$.ajax({
			url : 'http://localhost:8080/searchbylocation1',
			type : "GET",
			data : {

				lat : latitude,
				lng : longitude,//we are sending to Servlet get method

			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				var  myFGMarker = new L.FeatureGroup();
				for (var i = 0; i < data.length; i++) {
					var marker1 = L.marker([ data[i].latitude, data[i].longitude ],
							{
								draggable : 'true',
								/* icon:
								 */
							});
					marker1.bindPopup(data[i].username).openPopup();
					
					myFGMarker.addLayer(marker1);
				}
				

				myFGMarker.addTo(map);
				map.fitBounds(myFGMarker.getBounds());
			}
		});
		//alert(UserId)

	}
</script>
</head>
<body>
	<h1>All Owners &#9200;</h1>

	<div id="map" class="map"></div>
	<input type="text" id="lat" name="lattitude">
	<input type="text" id="lon" name="longitude">
	
	<script>
		getLocation(event);
	</script>

</body>
</html>