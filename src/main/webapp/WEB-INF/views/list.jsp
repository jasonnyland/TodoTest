<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Tasks</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">Task Manager</a>
		<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/newtask">New
						Task <span class="sr-only">(current)</span>
				</a></li>
			</ul>
	</nav>


	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Task</th>
				<th scope="col">Start Date</th>
				<th scope="col">End Date</th>
				<th scope="col">Description</th>
				<th scope="col">Email</th>
				<th scope="col">Severity</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${tasks}" var="task">
				<tr>
					<td>${task.id}</td>
					<td>${task.name}</td>
					<td><fmt:formatDate type="date" value="${task.startDate}" /></td>
					<td><fmt:formatDate type="date" value="${task.endDate}" /></td>
					<td>${task.description}</td>
					<td>${task.email}</td>
					<td>${task.severity}</td>
					<td><span> <a href="/edittask/${task.id}"><button
									type="button" class="btn btn-warning btn-sm">Edit</button></a> <a
							href="/deltask/${task.id}"><button type="button"
									class="btn btn-danger btn-sm">Delete</button></a>
					</span></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html>