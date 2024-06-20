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
</body>
</html>