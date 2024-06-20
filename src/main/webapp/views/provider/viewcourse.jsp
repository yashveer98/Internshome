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
</body>
</html>