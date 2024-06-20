<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to provider screen </title>
<%@include file="/views/common/allcss.html" %>
</head>
<body>
<%@include file="/views/provider/provider_navbar.html" %>
<h2> Welcome to the provider screen</h2>
<form method="post" action="/provider/editpassword">
<div style="width:50%;hieght:30%;background-color:cyan">
<h3><input type="text" name="userpass" value=""></h3>
<button type="submit">edit Password</button> 

</div> </form>
<%@include file="/views/common/alljs.html" %>

</body>
</html>