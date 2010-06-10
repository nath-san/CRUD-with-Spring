<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Create new person</h1>

<c:url value="/people" var="peopleUrl"/>

<form:form commandName="person" action="${peopleUrl}" method="post">
	First name: <form:input path="firstName"/><br/>
	Surname: <form:input path="surName"/><br/>
	Email: <form:input path="email"/><br/>
	Birth date: <form:input path="birthDate"/><br/>
	<input type="submit" value="Create new person"/>
</form:form>


<c:url value="/people" var="peopleUrl"/>
<a href="${peopleUrl}">All people</a>

</body>
</html>