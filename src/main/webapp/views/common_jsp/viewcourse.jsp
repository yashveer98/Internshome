<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title }</title>
<%@include file="/views/common/allcss.html" %>
</head>
<body>
<%@include file="/views/common/navbar.html" %>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Course Name</th>
      <th scope="col">Fees</th>
      <th scope="col">Duration</th>
 
    </tr>
  </thead>
  <tbody>
  <c:forEach var="cl" items="${cl}">
  <tr><th>${cl.coursename}</th>
  <th>${cl.fees}</th>
  <th>${cl.duration}</th>
  <th><a href="/studentenrollment/${cl.username}/${cl.coursename}">enroll</a></th>
  </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>