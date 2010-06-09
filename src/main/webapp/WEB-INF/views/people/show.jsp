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

<h1>Person: ${person.firstName} ${person.surName}</h1>
<c:url value="/people" var="peopleUrl"/>
<c:url value="/people/${person.id}/update" var="updateUrl"/>
<a href="${peopleUrl}">All people</a>
<a href="${updateUrl}">Update person</a>
</body>
</html>