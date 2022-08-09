<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

  <div class="wrapper">
	
	<a href="/home">
	<input type="submit" value="<- Return" class="return">
	</a>
		
		<form:form action="/names/${baby.id}" method="post" modelAttribute="baby" class="form">
			
			<input type="hidden" name="_method" value="put">
			<div class="form-group">
				<form:label path="name">Name:</form:label>
				<form:errors path="name" class="error"/>
				<form:input path="name" type="text" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:label path="gender">Gender:</form:label>
				<form:errors path="gender" class="error"/>
				<form:input path="gender" type="text" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:label path="origin">Origin:</form:label>
				<form:errors path="origin" class="error"/>
				<form:input path="origin" type="text" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:label path="meaning">Meaning:</form:label>
				<form:errors path="meaning" class="error"/>
				<form:input path="meaning" type="text" class="form-control"/>
			</div>
			<input type="submit" value="Update" class="btn-primary"/>
			<a href="/home" class="button">cancel</a>
		
		</form:form>
  </div>

</body>
</html>