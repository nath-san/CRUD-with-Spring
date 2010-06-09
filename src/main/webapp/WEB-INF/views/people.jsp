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

<h1>People</h1>

<ol>
<c:forEach items="${personList}" var="person">

<c:url value="/people/${person.id}" var="personUrl"/>
<li><a href="${personUrl}">${person.firstName}</a></li>

</c:forEach>
</ol>
<c:url value="/people/new" var="newUrl"/>
<a href="${newUrl}">Create new person</a>
</body>
</html>