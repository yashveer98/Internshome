<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css">
<%@include file="/views/common/allcss.html"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
<style>
html, body {
	height: 100%
	
}
body{
    background-color: #dee9ff;
}
.map {
	height: 300px;
	box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
	margin-bottom: 40px;
}
.card1{
padding:20px;
margin-right: 20px;
margin-left: 20px;

}
.card:hover{
outline: 1px solid black;
box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
 
  border: 5px solid transparent;
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
		//alert(latitude+" "+longitude)

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
	<%@include file="/views/common/navbar.html"%>
	<main>
	<section class="pt-5 pb-5">
	<div class="container-fluid ">
	<div class="card1 rounded-5 shadow-lg  " style="background-color:#AB8EC7; height:400px">
		<div class="card-body ">
		<h1 class="card-title text-dark text-center">Welcome to most easy Internship providing website</h1>
		<h3 class="card-text text-muted ">Get Paid Internship in your area</h3>
		<h3 class="card-text text-muted ">Most Affordable Training for latest technologies</h3>
		<br>
		<h2 class="card-text text-dark  ">Get Started</h2>
		</div>  
		</div>
	</div>
		<div class="container ">
		
		<div class="container-fluid bg-dark text-light text-center rounded-5 mt-3 pt-2 pb-1 mb-4 "><h2 class="mb-3">Top Companies</h2></div>
			<div class=" container mt-2 pt-2" >
			
				
				<div class="col-12">
								<div class="row">
										<c:forEach var="pl" items="${pl}">
										<div class="col-md-4 mb-3">
											<div class="card rounded-5" >
												<!-- <img class="img-fluid" alt="100%x280" src="#"> -->
												<div class="card-body ">
													<h3 class="card-title" >${pl.cmpname }</h3>
													<h5>${pl.city}</h5>
													<h5>${pl.phone }</h5>
													<h5>${pl.email }</h5>
													<a class="btn btn-primary"
														href="/common_jsp/viewcourse/${pl.username}" role="button">View
														Courses</a>
												</div>
											</div>
											</div>
										</c:forEach>
								</div>
							</div>
						</div>
					</div>
		
	</section>
	
	<div class="container mt-2">
	<h4  style="font-weight: bold;" class="text-dark">Companies Near You</h4>
	<div id="map" class="map"></div>
	<input type="hidden" id="lat" name="lattitude">
	<input type="hidden" id="lon" name="longitude">
	
	<script>
		getLocation(event);
	</script>
	</div>
	<div class="container">
	
	<div class="row">
	<div class="col-6">
	<div class="container" >
	<div class="container bg-dark text-light mt-3 rounded-5 text-center">
	<h2>Notice</h2>
	</div>
	<ul class="list-group">
	<c:forEach var="ntc" items="${ntc}">
  <li class="list-group-item">* ${ntc.content}-${ntc.date}</li>
  </c:forEach>
</ul>
</div></div>
</div>
</div>
	</main>
	<%@include file="/views/common/footer.html"%>
	<%@include file="/views/common/alljs.html"%>


</body>
</html>