<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/views/common/allcss.html"%>
<style >
body{
    background-color: #dee9ff;
}
.card:hover{
outline: 1px solid black;
box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
 
  border: 5px solid transparent;
}
</style>
</head>
<body>
<%@include file="/views/common/navbar.html"%>
<!-- Card deck -->
<div class="container-fluid bg-dark text-white"><h2 align="center" >Job Profile list</h2></div>

<div class="container" >
<div class="row justify-content-center" style="padding-top:10px">

<c:forEach var="jl" items="${jl}">
  <!-- Card -->
  <div class="col-3">
  <div class="card">
  <div class="card mb-1" >

    <!--Card image-->
    <div class="view overlay">
      <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/16.webp"
        alt="100%x280">
      <a href="#!">
        <!-- <div class="mask rgba-white-slight"></div> -->
      </a>
    </div>

    <!--Card content-->
    <div class="card-body"    >

      <!--Title-->
      <h4 class="card-title">${jl.postname}</h4>
      <!--Text-->
      <h5>${jl.vacancies}</h5>
      <h5>${jl.elegibility}</h5>
      <h5>${jl.mailid}</h5>
      <h5>${jl.lastdate}</h5>
      <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
      <!-- <button type="button" class="btn btn-light-blue btn-md">Read more</button> -->
    </div>
  </div>
  </div>
  </div>
  </c:forEach>

</div>
</div>
<!-- Card deck -->

<%@include file="/views/common/alljs.html" %>
</body>
</html>