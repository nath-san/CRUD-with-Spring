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

<h1>Update person</h1>
<c:url value="/people/${person.id}" var="personUrl"/>

<form:form commandName="person" action="${personUrl}" method="put">
	First name: 
	<form:errors path="firstName" style="color:red;"/><br/>
	<form:input path="firstName"/><br/>
	Surname: 
	<form:errors path="surName" style="color:red;"/><br/>
	<form:input path="surName"/><br/>
	Email:
	<form:errors path="email" style="color:red;"/><br/> 
	<form:input path="email"/><br/>
	Birth date:
	<form:errors path="birthDate" style="color:red;"/><br/> 
	<form:input path="birthDate"/><br/>
	<form:hidden path="id"/>
	<input type="submit" value="Update person"/>
</form:form>

</body>
</html>