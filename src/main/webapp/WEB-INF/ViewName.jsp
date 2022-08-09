<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Baby Name</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="wrapper">
	
		<h1><c:out value="${babynames.name}"/></h1>
		<a href="/home" class="dashboard">Back to dashboard</a>
		

		
		<table class="table">
			<tr>
				<th>Typical Gender:</th>
				<td><c:out value="${babynames.gender}"/></td>
			</tr>
			<tr>
				<th>Origin:</th>
				<td><c:out value="${babynames.origin}"/></td>
			</tr>
			<tr>
				<th>Meaning:</th>
				<td><c:out value="${babynames.meaning}"/></td>
			</tr>
				
		</table>
		
	</div>

</body>
</html>