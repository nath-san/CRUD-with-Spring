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

<h1>Update person</h1>
<c:url value="/people/${person.id}" var="personUrl"/>
<form action="${personUrl}" method="post"><br/>
	First name: <br/>
	<input type="text" name="firstName" size="20" value="${person.firstName}"/><br/>
	Surname: <br/>
	<input type="text" name="surName" size="20" value="${person.surName}"/><br/>
	Email:<br/>
	<input type="text" name="email" size="30" value="${person.email}"/><br/>
	Birthdate:<br/>
	<input type="text" name="birthDate" size="20" value="${person.birthDate}"/><br/>
	<input type="hidden" name="_method" value="put"/>
	<input type="submit" value="update person"/>
</form>

</body>
</html>