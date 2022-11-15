<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Policy</title>
</head>
<body>
	<form action="DeletePolicy.jsp">
		Policy Id : 
		<input type="text" name="policyId" /> <br/><br/>
		<input type="submit" value="Delete" /> <br/><br/>
	</form>
	<c:if test="${param.policyId!=null}">
		<sql:setDataSource var="conn" 
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/insurance"
		user="root"
		password="Javed@123"
	/>
		<sql:update var="employQuery" dataSource="${conn}">delete from policydetails where policyId=? 
			<sql:param value="${param.policyId}"/>
		</sql:update>
			<c:out value="Deleted" />
	</c:if>
</body>
</html>