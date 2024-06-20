<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

*, body {
    font-family: 'Poppins', sans-serif;
    font-weight: 400;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    -moz-osx-font-smoothing: grayscale;
}

html, body {
    height: 100%;
    background-color: #152733;
    overflow: hidden;
}
.map {
         height: 300px;
         }


.form-holder {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      min-height: 100vh;
}

.form-holder .form-content {
    position: relative;
    text-align: center;
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
    padding: 60px;
}

.form-content .form-items {
    border: 3px solid #fff;
    padding: 40px;
    display: inline-block;
    width: 100%;
    min-width: 540px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    text-align: left;
    -webkit-transition: all 0.4s ease;
    transition: all 0.4s ease;
}

.form-content h3 {
    color: #fff;
    text-align: left;
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 5px;
}

.form-content h3.form-title {
    margin-bottom: 30px;
}

.form-content p {
    color: #fff;
    text-align: left;
    font-size: 17px;
    font-weight: 300;
    line-height: 20px;
    margin-bottom: 30px;
}


.form-content label, .was-validated .form-check-input:invalid~.form-check-label, .was-validated .form-check-input:valid~.form-check-label{
    color: #fff;
}

.form-content input[type=text], .form-content input[type=password], .form-content input[type=email], .form-content select, .form-content input[type=tel] {
    width: 100%;
    padding: 9px 20px;
    text-align: left;
    border: 0;
    outline: 0;
    border-radius: 6px;
    background-color: #fff;
    font-size: 15px;
    font-weight: 300;
    color: #8D8D8D;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
    margin-top: 16px;
}


.btn-primary{
    background-color: #6C757D;
    outline: none;
    border: 0px;
     box-shadow: none;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active{
    background-color: #495056;
    outline: none !important;
    border: none !important;
     box-shadow: none;
}

.form-content textarea {
    position: static !important;
    width: 100%;
    padding: 8px 20px;
    border-radius: 6px;
    text-align: left;
    background-color: #fff;
    border: 0;
    font-size: 15px;
    font-weight: 300;
    color: #8D8D8D;
    outline: none;
    resize: none;
    height: 120px;
    -webkit-transition: none;
    transition: none;
    margin-bottom: 14px;
}

.form-content textarea:hover, .form-content textarea:focus {
    border: 0;
    background-color: #ebeff8;
    color: #8D8D8D;
}

.mv-up{
    margin-top: -9px !important;
    margin-bottom: 8px !important;
}

.invalid-feedback{
    color: #ff606e;
}

.valid-feedback{
   color: #2acc80;
}
</style>
<script>
(function () {
'use strict'
const forms = document.querySelectorAll('.requires-validation')
Array.from(forms)
  .forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()

</script>
</head>
<body>

   <div class="form-body">
        <div class="row">
            <div class="form-holder">
            <div class="wrapper">
                <div class="form-content">
                    <div class="form-items ">
                        <h3 >Provider Registration</h3>
                        <p>Fill in the data below.</p>
                        <form class="requires-validation" novalidate>
                        
                        <div class="col-md-12">
                               <input class="form-control" type="text" name="username" placeholder="User Name" required>
                               <div class="valid-feedback">User name field is valid!</div>
                               <div class="invalid-feedback">User name field cannot be blank!</div>
                            </div>
                             <div class="col-md-12">
                              <input class="form-control" type="password" name="password" placeholder="Password" required>
                               <div class="valid-feedback">Password field is valid!</div>
                               <div class="invalid-feedback">Password field cannot be blank!</div>
                           </div>
                            <div class="col-md-12">
                               <input class="form-control" type="text" name="cmpname" placeholder="Company Name" required>
                               <div class="valid-feedback">Name field is valid!</div>
                               <div class="invalid-feedback">Name field cannot be blank!</div>
                            </div>

                            <div class="col-md-12">
                                <input class="form-control" type="email" name="email" placeholder="E-mail Address" required>
                                 <div class="valid-feedback">Email field is valid!</div>
                                 <div class="invalid-feedback">Email field cannot be blank!</div>
                            </div>
                            
                            <div class="col-md-12">
                                <input class="form-control" type="tel" name="phone" placeholder="Phone Number" required>
                                 <div class="valid-feedback">Phone Number field is valid!</div>
                                 <div class="invalid-feedback">Phone Number be blank!</div>
                            </div>
                            
                            <div class="col-md-12">
                                <textarea class="form-control " id="aboutcmp" name="aboutcmp" placeholder="Write About Your Company" rows="3"></textarea>
                                 <div class="valid-feedback">This field is valid!</div>
                                 <div class="invalid-feedback">This field cannot be blank!</div>
                            </div>
                            
                            

                           <div class="col-md-12">
                                <select class="form-select mt-3" required>
                                      <option selected disabled value="">City</option>
                                      <option value="Lucknow">Lucknow</option>
                                      <option value="Delhi">Delhi</option>
                                      <option value="Banglore">Banglore</option>
                               </select>
                                <div class="valid-feedback">You selected a City!</div>
                                <div class="invalid-feedback">Please select a City!</div>
                           </div>
                           <div id="map" class="map"></div>
      Lat : <input type="hidden" id="lat" name="lattitude">
      Lon : <input type="hidden" id="lon" name="longitude">
      <script>
         getLocation(event);
      </script>

                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                          <label class="form-check-label">I confirm that all data are correct</label>
                         <div class="invalid-feedback">Please confirm that the entered data are all correct!</div>
                        </div>
                        
                        
      
               <div class="form-button mt-3">
                                <button id="submit" type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
     <%@include file="/views/common/alljs.html" %>
</body>
</html>