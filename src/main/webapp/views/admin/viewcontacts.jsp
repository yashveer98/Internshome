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
</body>
</html>