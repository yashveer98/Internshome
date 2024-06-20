<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<%@include file="/views/common/allcss.html" %>
</head>
<body>
<%@include file="/views/provider/provider_navbar.html" %>
<h2> Welcome to the provider screen</h2>
<form method="post" action="/provider/post_editprofile">
<div style="width:50%;hieght:30%;background-color:cyan">
<h3><input type="text" name="email" value="${user.email }"></h3>
<h3><input type="tel" name="phone" value="${user.phone }"></h3>
<button type="submit">edit Profile</button> 

</div> </form>
<%@include file="/views/common/alljs.html" %>

</body>
</html>