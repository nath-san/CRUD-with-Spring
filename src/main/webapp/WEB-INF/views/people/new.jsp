<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Create new person</h1>

<c:url value="/people" var="peopleUrl"/>
<form action="${peopleUrl}" method="post">
		First name:<input type="text" name="firstName" size="20"/><br/>
		Surname:<input type="text" name="surName" size="20"/><br/>
		Email:<input type="text" name="email" size="30"/><br/>
		Birthday:<input type="text" name="birthDate" size="20"/><br/>
		<input type="submit" value="new person"/>				
</form>
<c:url value="/people" var="peopleUrl"/>
<a href="${peopleUrl}">All people</a>

</body>
</html>