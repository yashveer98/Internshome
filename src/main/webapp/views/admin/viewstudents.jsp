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
</body>
</html>