<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<%@include file="/views/common/allcss.html" %>
<style >
body {
  background-color:#dee9ff;
}
@media (min-width: 991.98px) {
  main {
    padding-left: 240px;
  }
}

/* Sidebar */
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  padding: 58px 0 0; /* Height of navbar */
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
  width: 240px;
  z-index: 600;
}

@media (max-width: 991.98px) {
  .sidebar {
    width: 100%;
  }
}
.sidebar .active {
  border-radius: 5px;
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: 0.5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}
</style>
<script >
//Graph
var ctx = document.getElementById("myChart");

var myChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ],
    datasets: [
      {
        data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
        lineTension: 0,
        backgroundColor: "transparent",
        borderColor: "#007bff",
        borderWidth: 4,
        pointBackgroundColor: "#007bff",
      },
    ],
  },
  options: {
    scales: {
      yAxes: [
        {
          ticks: {
            beginAtZero: false,
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});
</script>
<script>
function admission(){
	
	var div=document.getElementById("admission");
	if(div.style.display === "none"){
		div.style.display = "block";
	}
	else{
		div.style.display = "none";
	}
}
function feedback(){
	
	var div=document.getElementById("feedback");
	if(div.style.display === "none"){
		div.style.display = "block";
	}
	else{
		div.style.display = "none";
	}
}
function contact(){
	
	var div=document.getElementById("contact");
	if(div.style.display === "none"){
		div.style.display = "block";
	}
	else{
		div.style.display = "none";
	}
}
function provider(){
	
	var div=document.getElementById("provider");
	if(div.style.display === "none"){
		div.style.display = "block";
	}
	else{
		div.style.display = "none";
	}
}
function student(){
	
	var div=document.getElementById("student");
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
<!--Main Navigation-->
<header>
  <!-- Sidebar -->
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
        <a
          href="#"
          class="list-group-item list-group-item-action py-2 ripple"
          aria-current="true"
        >
          <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple " onclick="feedback()">
          <span>Feedbacks</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple" onclick="contact()"
          ><span>Contacts</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple" onclick="provider()"
          ><span>Provider</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple" onclick="student()">
          <span>Student</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple" onclick="admission()"
          ><span>Admissions</span></a
        >
         <a href="/message" class="list-group-item list-group-item-action py-2 ripple"
          ><span>Message</span></a
        >
      <!--  <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-building fa-fw me-3"></i><span>Partners</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-calendar fa-fw me-3"></i><span>Calendar</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-users fa-fw me-3"></i><span>Users</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-money-bill fa-fw me-3"></i><span>Sales</span></a
        > -->
      </div>
    </div>
  </nav>
  <!-- Sidebar -->

  <!-- Navbar -->
  <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <!-- Container wrapper -->
    <div class="container-fluid">
      <!-- Toggle button -->
      <button
        class="navbar-toggler"
        type="button"
        data-mdb-toggle="collapse"
        data-mdb-target="#sidebarMenu"
        aria-controls="sidebarMenu"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>

      <!-- Brand -->
      <a class="navbar-brand" href="#">
        <img
          src="/views/images/Internshome3.png"
          height="25"
          alt="MDB Logo"
          loading="lazy"
        />
      </a>
      
      <!-- Search form -->
      <form class="d-none d-md-flex input-group w-auto my-auto">
        <input
          autocomplete="off"
          type="search"
          class="form-control rounded"
          placeholder='Search (ctrl + "/" to focus)'
          style="min-width: 225px;"
        />
        <span class="input-group-text border-0"><i class="fas fa-search"></i></span>
      </form>

      <!-- Right links -->
      <ul class="navbar-nav ms-auto d-flex flex-row">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Settings
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/admin/edit_profile">Edit Profile</a></li>
            <li><a class="dropdown-item" href="/admin/edit_password">Edit Password</a></li>
          </ul>
        </li>
        <!-- Notification dropdown -->
        <li class="nav-item dropdown">
          <a
            class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow"
            href="#"
            id="navbarDropdownMenuLink"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
           
          >
            <i class="fas fa-bell"></i>
            <span class="badge rounded-pill badge-notification bg-danger">1</span>
          </a>
          <ul
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="navbarDropdownMenuLink"
          >
            <li>
              <a class="dropdown-item" href="#">Some news</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Another news</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Something else here</a>
            </li>
          </ul>
        </li>

       

        <!-- Avatar -->
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center"
            href="#"
            id="navbarDropdownMenuLink"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false" 
            
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp"
              class="rounded-circle"
              height="22"
              alt="Avatar"
              loading="lazy"
            />
          </a>
          <ul
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="navbarDropdownMenuLink"
          >
            <li>
              <a class="dropdown-item" href="#">My profile</a>
            </li>
            <li>
              <a class="dropdown-item" href="/admin/admin_logout">Logout</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- Container wrapper -->
  </nav>
  <!-- Navbar -->
</header>
<!--Main Navigation-->

<!--Main layout-->
<main style="margin-top: 58px;">
  <div class="container pt-4">
  <div class="container-fluid bg-dark text-light" >
<h2>Welcome Admin</h2>
</div>

  <div class="wrapper bg-light rounded-3 ps-3 pt-2 " style="display:none" id="admission" >
<h3>Admission</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Course Name</th>
      <th scope="col">Name</th>
      <th scope="col">Transaction Id</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="sl" items="${sl}">
  <tr>
  <th>${sl.courseid}</th>
  <th>${sl.name}</th>
  <th>${sl.transactionid}</th>
  <th><a href="/admin/statuschange/${sl.enrollStatus}/${sl.formid}" role="button">${sl.enrollStatus}</a></th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
<div class="wrapper bg-light rounded-3 ps-3 pt-2" style="display: none" id=student>
<h3>Students</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">City</th>
      <th scope="col">College</th>
      <th scope="col">Degree</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="cl" items="${sl}">
  <tr>
  <th>${cl.name}</th>
  <th>${cl.email}</th>
  <th>${cl.phone}</th>
  <th>${cl.city}</th>
  <th>${cl.college}</th>
  <th>${cl.degree}</th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
<div class="wrapper bg-light rounded-3 ps-3 pt-2" style="display:none" id=provider>
<h3>Providers</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Company Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">City</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="pl" items="${pl}">
  <tr><th>${pl.cmpname}</th>
  <th>${pl.email}</th>
  <th>${pl.phone}</th>
  <th>${pl.city}</th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
<div class="wrapper bg-light rounded-3 ps-3 pt-2" style="display:none" id=contact>
<h3>Contacts</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">Message</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="contactObject" items="${lc}">
  <tr><th>${contactObject.name}</th>
  <th>${contactObject.email}</th>
  <th>${contactObject.phone}</th>
  <th>${contactObject.message}</th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
<div class="wrapper bg-light rounded-3 ps-3 pt-2" style="display: none" id=feedback>
<h3>Feedback</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">feedback</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="feedbackObject" items="${lf}">
  <tr><th><a href="/admin/review/${feedbackObject.id }">${feedbackObject.name}</a></th>
  <th>${feedbackObject.email}</th>
  <th>${feedbackObject.phone}</th>
  <th>${feedbackObject.feedback}</th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
</div>
</main>
<!--Main layout-->



<%@include file="/views/common/alljs.html" %>
</body>
</html>