<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Joy Bundler Names</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="wrapper">
		<h1>Hello,${user.user_name} here are some name suggestions...</h1> <a href="/logout" class="logout">logout</a>
		<h2>Baby Names</h2>

		<table class="table">
			<tr>
				<th>Name</th>
				<th>Gender</th>
				<th>Origin</th>
			</tr>
			
			<c:forEach var="eachBaby" items="${babies}">
			
				<tr>
					<td><a href="/names/${eachBaby.id}"><c:out value="${eachBaby.name}"/></a></td>
					<td><c:out value="${eachBaby.gender}"/></td>
					<td><c:out value="${eachBaby.origin}"/></td>
				<td>
				<a href="/names/<c:out value="${eachBaby.id}"/>/edit">
						<input type="submit" value="Edit" class="green">
						</a> 
				
				
				
				<form action="/names/${eachBaby.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete" class="btn-danger">
				</form>
				</td>
				</tr>
				
				
			</c:forEach>	
		</table>
		<h1>Add a Name!</h1>
		
		<form:form action="/home" method="post" modelAttribute="baby">
		
			<div class="form-group">
				<form:label path="name">Name:</form:label>
				<form:errors path="name" class="error"/>
				<form:input path="name" type="text" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="gender">Gender:</label>
				<select name="gender" id="gender">
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="neutral">Neutral</option>
				</select>
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
				
			<input type="submit" value="Add a Name" class="btn-primary"/>
		
		</form:form>
		
		
	</div>
</body>
</html>