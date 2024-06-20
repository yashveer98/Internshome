<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>The Easiest Way to Add Input Masks to Your Forms</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
<%@include file="/views/common/allcss.html" %>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
      <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>  
    <script>
         function getLocation() { 
           
           if (!navigator.geolocation) {
             alert("Browser doesn't support geolocation");
           } else {
             navigator.geolocation.getCurrentPosition(success, error);
           }
         }
         
         // Get current position successfully
         function success(position) {
           var map, marker,
               latitude = position.coords.latitude,
               longitude = position.coords.longitude;
           
           // Instance map using leaflet
           map = L.map('map').setView([latitude, longitude], 13);
           
           // Tile layer using key api at cloudmade.com
           L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
             key: '760506895e284217a7442ce2efe97797',
             styleId: 103288,
             maxZoom: 16
           }).addTo(map);
         
           // Marker using leaflet
           marker = L.marker([latitude, longitude], {
             draggable: 'true'
           }).addTo(map);
         
         
         //Drag Marker
         marker.on('dragend', function(event) {
             var position = marker.getLatLng();
             marker.setLatLng(position, {
               draggable: 'true'
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
      </script>
<style>
body{
    background-color: #dee9ff;
}

.registration-form{
	padding: 50px 0;
}
.map {
         height: 300px;
         }


.registration-form form{
    background-color: #fff;
    max-width: 600px;
    margin: auto;
    padding: 50px 70px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .form-icon{
	text-align: center;
    background-color: #5891ff;
    border-radius: 50%;
    font-size: 40px;
    color: white;
    width: 100px;
    height: 100px;
    margin: auto;
    margin-bottom: 50px;
    line-height: 100px;
}

.registration-form .item{
	border-radius: 20px;
    margin-bottom: 25px;
    padding: 10px 20px;
}

.registration-form .create-account{
    border-radius: 30px;
    padding: 10px 20px;
    font-size: 18px;
    font-weight: bold;
    background-color: #5791ff;
    border: none;
    color: white;
    margin-top: 20px;
}

.registration-form .social-media{
    max-width: 600px;
    background-color: #fff;
    margin: auto;
    padding: 35px 0;
    text-align: center;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
    color: #9fadca;
    border-top: 1px solid #dee9ff;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .social-icons{
    margin-top: 30px;
    margin-bottom: 16px;
}

.registration-form .social-icons a{
    font-size: 23px;
    margin: 0 3px;
    color: #5691ff;
    border: 1px solid;
    border-radius: 50%;
    width: 45px;
    display: inline-block;
    height: 45px;
    text-align: center;
    background-color: #fff;
    line-height: 45px;
}

.registration-form .social-icons a:hover{
    text-decoration: none;
    opacity: 0.6;
}

@media (max-width: 576px) {
    .registration-form form{
        padding: 50px 20px;
    }

    .registration-form .form-icon{
        width: 70px;
        height: 70px;
        font-size: 30px;
        line-height: 70px;
    }
}
</style>
<script>
$(document).ready(function(){
  $('#birth-date').mask('00/00/0000');
  $('#phone-number').mask('0000-0000');
 })
</script>
</head>
<body>
<%@include file="/views/common/navbar.html" %>
    <div class="registration-form">
        <form action="/provider/provider_register" method="post">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="username" name="username" placeholder="Username" required="required">
            </div>
            <div class="form-group">
                <input type="password" class="form-control item" id="password" name="password" placeholder="Password" required="required">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="cmpname" name="cmpname" placeholder="Company Name" required="required">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="email" name="email" placeholder="Email" required="required">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="phone" name="phone" placeholder="Phone Number" required="required">
            </div>
            <div class="form-group">
                <select class="form-control item" required>
                                      <option selected disabled value="">City</option>
                                      <option value="Lucknow">Lucknow</option>
                                      <option value="Delhi">Delhi</option>
                                      <option value="Banglore">Banglore</option>
                               </select>
            </div>
            
            <div class="form-group">
                <input type="text" class="form-control item" id="city" name="city" placeholder="City" required="required">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="address" name="address" placeholder="Address" required="required">
            </div>

            <div class="form-group">
                <textarea class="form-control item" id="aboutcmp" name="aboutcmp" placeholder="Write About Your Company" rows="3" required="required"></textarea>
            </div>
            <div class="form-group">
                  <div id="map" class="map"></div>
      Lat : <input type="hidden" id="lat" name="lattitude">
      Lon : <input type="hidden" id="lon" name="longitude">
      <script>
         getLocation(event);
      </script>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-block create-account">Create Account</button>
            </div>
        </form>
        <div class="social-media">
            <h5>Sign up with social media</h5>
            <div class="social-icons">
                <a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
                <a href="#"><i class="icon-social-google" title="Google"></i></a>
                <a href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
            </div>
        </div>
    </div>
     <%@include file="/views/common/alljs.html" %>
</body>
</html>
