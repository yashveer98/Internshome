<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
      <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>  
<%@include file="/views/common/allcss.html" %>
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
/* Importing fonts from Google */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

/* Reseting */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    background: linear-gradient(to bottom, #000428, #004683);
}
.map {
         height: 300px;
         }

.wrapper {
    max-width: 450px;
    margin: 50px auto;
    padding: 20px 30px;
    min-height: 300px;
    background-color: #ffffff27;
    border-top: 1px solid #ffffff6e;
    border-left: 1px solid #ffffff6e;
    border-radius: 15px;
}

.wrapper .h5 {
    color: #ddd;
}

.wrapper .form-group {
    border-bottom: 1px solid #ccc;
    margin-bottom: 1.5rem;
}

.wrapper .form-group:hover {
    border-bottom: 1px solid #eee;
}

.wrapper .form-group .icon {
    color: #e8e8e8;
}

.wrapper .form-group .form-control {
    background: inherit;
    border: none;
    border-radius: 0px;
    box-shadow: none;
    color: #e9e9e9;
}

.wrapper .form-group input::placeholder {
    color: #ccc;
}

.wrapper .form-group input:focus::placeholder {
    opacity: 0;
}

.wrapper .form-group .fa-phone {
    transform: rotate(90deg);
}


.wrapper .option {
    color: #ccc;
    display: block;
    position: relative;
    padding-left: 25px;
    margin-bottom: 12px;
    cursor: pointer;
    user-select: none
}

.wrapper .option:hover {
    color: #eee;
}

.wrapper .option input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0
}

.wrapper .checkmark {
    position: absolute;
    top: 3px;
    left: 0;
    height: 18px;
    width: 18px;
    background-color: inherit;
    border: 2px solid #ccc;
    border-radius: 2px
}

.wrapper .option input:checked~.checkmark {
    transition: 300ms ease-in-out all
}

.wrapper .checkmark:after {
    content: "\2713";
    position: absolute;
    display: none;
    font-weight: 600;
    color: #FFF;
    font-size: 0.9rem;
}

.wrapper .option input:checked~.checkmark:after {
    display: block
}

.wrapper .option .checkmark:after {
    left: 2px;
    top: -4px;
    width: 5px;
    height: 10px
}

.wrapper .btn.btn-primary {
    position: relative;
    color: #eee;
    padding: 0.3rem 1rem;
    border-radius: 20px;
    border: 1px solid #ddd;
    background-color: inherit;
    box-shadow: none;
    overflow: hidden;
}

.wrapper .btn.btn-primary:hover {
    background-color: #b4b4b433;
    color: #fff;
}

.wrapper .terms {
    color: #bbb;
    font-size: 0.85rem;
    text-align: center;
}

.wrapper .terms a {
    text-decoration: none;
    color: #eee;
}

.wrapper .terms a:hover {
    color: #fff;
}

.wrapper .connect {
    position: relative;
}

.wrapper .connect::after {
    content: "or";
    position: absolute;
    top: -12px;
    width: 80px;
    left: 39%;
    text-align: center;
    color: #eee;
    z-index: 100;
    background-color: rgba(255, 255, 255, 0.315);
    background-color: #1f5588;
}

.wrapper .social-links {
    margin-top: 50px;
    position: relative;
    list-style: none;
    display: flex;
    justify-content: space-around;
}

.wrapper .social-links li a {
    font-size: 1.2rem;
    width: 50px;
    height: 50px;
    background-color: #ffffff17;
    border: 1px solid #ffffff66;
    border-right: 1px solid #ffffff33;
    border-bottom: 1px solid #ffffff33;
    display: flex;
    text-decoration: none;
    justify-content: center;
    align-items: center;
    color: #fff;
    border-radius: 6px;
    box-shadow: 0 5px 30px #004683e0;
    transition: 0.5s;
    overflow: hidden;
}

.wrapper .social-links li a:hover {
    transform: translateY(-20px);
}

.wrapper .social-links li a::before,
.wrapper .btn.btn-primary::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 25px;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.6);
    transform: skew(45deg) translateX(130px);
    transition: .5s;
    opacity: 0;
}

.wrapper .social-links li a:hover:before,
.wrapper .btn.btn-primary:hover::before {
    opacity: 1;
    transform: skew(45deg) translateX(-130px);
}

@media(max-width: 460px) {
    .wrapper {
        margin: 15px;
        padding: 20px;
    }

    .wrapper .connect::after {
        left: 38%;
    }
}

@media(max-width: 345px) {
    .wrapper .connect::after {
        left: 32%;
    }
}
</style>
</head>
<body>
<%@include file="/views/common/navbar.html" %>

<div class="wrapper">
        <form action="/provider/provider_register" method="post">
            <div class="h5 font-weight-bold text-center mb-3">Provider Registration</div>
            <div class="form-group d-flex align-items-center">
                <div class="icon"><span class="far fa-user"></span></div>
                <input autocomplete="off" type="text" class="form-control" id="username" name="username" placeholder="Enter Username">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class="icon"><span class="far fa-envelope"></span></div>
                <input autocomplete="off" type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class=""><span class="far fa-envelope"></span></div>
                <input autocomplete="off" type="text" class="form-control" id="cmpname" name="cmpname" placeholder="Company Name">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class=""><span class="far fa-envelope"></span></div>
                <input autocomplete="off" type="email" class="form-control" id="email" name="email" placeholder="Email">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class="icon"><span class="fas fa-phone"></span></div>
                <input autocomplete="off" type="tel" class="form-control" id="phone" name="phone" placeholder="Phone">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class="icon"><span class="fas fa-map-marker-alt"></span></div>
                <input autocomplete="off" type="text" class="form-control" id="city" name="city" placeholder="City">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class="icon"><span class="fas fa-map-marker-alt"></span></div>
                <input autocomplete="off" type="text" class="form-control" id="address" name="address" placeholder="address">
            </div>
            <div class="form-group d-flex align-items-center">
                <div class="icon"><span class="fas fa-map-marker-alt"></span></div>
                <textarea class="form-control text-light" id="aboutcmp" name="aboutcmp" placeholder="Write About Your Company" rows="3"></textarea>
            </div>
            
            	<div id="map" class="map"></div>
      Lat : <input type="hidden" id="lat" name="lattitude">
      Lon : <input type="hidden" id="lon" name="longitude">
      <script>
         getLocation(event);
      </script>
            <div> <button type="submit" class="btn btn-primary mb-3">Submit</button></div>
            <div class="terms mb-2">
                By clicking "Signup", you acknowledge that you have read the
                <a href="#">Privacy Policy</a> and agree to the
                <a href="#">Terms of Service</a>.
            </div>
            <div class="connect border-bottom mt-4 mb-4"></div>
            <ul class="p-0 social-links">
                <li><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                <li><a href="#"><span class="fab fa-google"></span></a></li>
                <li><a href="#"><span class="fab fa-github"></span></a></li>
            </ul>
        </form>
    </div>
    <%@include file="/views/common/alljs.html" %>
</body>
</html>