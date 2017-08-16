<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
</head>
<body>
	<form method="POST" action="${path}/user/login" class="form-signin">
		<p>Login</p>
		<p style="color:red;">${error}</p>
		<p style="color:green;">${message}</p>
		<p><input name="username" type="text" placeholder="Username"/></p>
		<p><input name="password" type="password" placeholder="Password" /></p>
		<p>
			<input type="checkbox" name="remember-me" id="remember-me"/>
			<label>Remember Me</label>
		</p>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<p><button type="submit">Login</button></p>
	</form>
</body>
</html>