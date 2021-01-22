<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit a Task</title>
<link rel="stylesheet" href="/bootstrap.min.css">
</head>
<body class="bg-primary">
<div class="container p-3">
<div class="row">
<div class="w-50 mx-auto">
	<div class="card border-primary ">
		<div class="card-header">
			Edit a Task
		</div>
		<div class="card-body">
			<form:form modelAttribute="form">
				<form:errors path="" element="div" />
				<div class="form-group">
					<form:label path="name">Task Name</form:label>
					<form:input path="name" class="form-control" value="${task.name}" />
					<form:errors path="name" />
				</div>
				<div class="form-group">
					<form:label path="startDate">Start Date</form:label>
					<form:input path="startDate" type="date" class="form-control" value="${task.startDate}"/>
					<form:errors path="startDate" />
				</div>
				<div class="form-group">
					<form:label path="endDate">End Date</form:label>
					<form:input path="endDate" type="date" class="form-control" value="${task.endDate}"/>
					<form:errors path="endDate" />
				</div>
				<div class="form-group">
					<form:label path="description">Task Description</form:label>
					<form:input path="description" class="form-control" value="${task.description}"/>
					<form:errors path="description" />
				</div>
				<div class="form-group">
					<form:label path="email">Email</form:label>
					<form:input path="email" type="email" class="form-control" value="${task.email}"/>
					<form:errors path="email" />
				</div>
				<div class="form-group">
					<form:label path="severity">Severity</form:label>
					<form:select path="severity" class="form-control">
						<option value="1" ${task.severity == 1 ? "selected" : ""}>Low</option>
						<option value="2" ${task.severity == 2 ? "selected" : ""}>Medium</option>
						<option value="3" ${task.severity == 3 ? "selected" : ""}>High</option>
					</form:select>
					<form:errors path="severity" />
				</div>
				<div>
					<input type="submit" class="btn btn-primary" value="Save Task" />
				</div>
			</form:form>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>