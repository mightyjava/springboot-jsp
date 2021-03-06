<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
</head>
<body>
	<form:form method="post" action="${path}/user/add" commandName="userForm">
		<form:hidden path="id"/>
		<p>Full Name : <form:input path="fullName" placeholder="Enter Full Name"/></p>
		<p>User Id : <form:input path="userId" placeholder="Enter User Id"/></p>
		<p>User Name : <form:input path="userName" placeholder="Enter User Name"/></p>
		<p>Password : <form:password path="password" placeholder="Enter Password"/></p>
		<p>
			Role :
			<form:select path="role.id">
				<c:forEach items="${roles}" var="role">
					<form:option value="${role.id}">${role.name}</form:option>
				</c:forEach>
			</form:select>
		</p>
		<p>
			<form:button value="Save">Save</form:button> 
			<a href="${path}/user/list"> List User</a>
		</p>
	</form:form>
</body>
</html>