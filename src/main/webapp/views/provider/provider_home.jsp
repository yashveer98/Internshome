<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to provider screen </title>
<%@include file="/views/common/allcss.html" %>
<%@include file="/views/common/sidebarcss.html" %>
<%@include file="/views/common/sidebarjs.html" %>
<script>
function viewCourse(){
	
	var div=document.getElementById("viewcourse");
	if(div.style.display === "none"){
		div.style.display = "block";
	}
	else{
		div.style.display = "none";
	}
}
function mainDashboard(){
	
	var div=document.getElementById("main");
	if(div.style.display === "none"){
		div.style.display = "block";
	}
	else{
		div.style.display = "none";
	}
}
</script>

</head>
<body>
<%@include file="/views/provider/provider_sidebar.html" %>
<main style="margin-top: 58px;">
  <div class="container pt-4">
<div class="container-fluid bg-dark text-light" >
<h2>Welcome to ${user.cmpname} Dashboard </h2>
</div>
<div class="wrapper" style="display:none;" id=main>
<h2> Welcome to the provider screen ${user.username}</h2>
<div style="width:50%;hieght:30%;background-color:cyan">
<h3>${user.email }</h3>
<h3>${user.cmpname}</h3>
<h3>${user.phone}</h3>
</div>
</div>
<div class="wrapper bg-light rounded-3 ps-3 pt-2" style="display: none" id=viewcourse>
<h3>Courses</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Course Name</th>
      <th scope="col">Fees</th>
      <th scope="col">Duration</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="courseObject" items="${sc}">
  <tr><th><a href="/provider/review/${feedbackObject.id }">${courseObject.coursename}</a></th>
  <th>${courseObject.fees}</th>
  <th>${courseObject.duration}</th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
</div>
</main> 
<%@include file="/views/common/alljs.html" %>

</body>
</html>