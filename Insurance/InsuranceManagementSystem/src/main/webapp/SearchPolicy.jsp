<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="SearchPolicy.jsp">
	Policy Id :
	<input type="text" name="policyId" /><br/><br/>
	<input type="submit" value="Search Policy" /><br/><br/>
</form>
<c:if test="${param.policyId!=null}">
	<sql:setDataSource var="conn"
	driver ="com.mysql.jdbc.Driver"
	url="jdbc:mysql://Localhost:3306/insurance"
	user="root"
	password="Javed@123"
/>

	<sql:query var="policyQuery" dataSource="${conn}">
		select * from policydetails where policyId=?
	<sql:param value="${param.policyId}"/>
	
</sql:query>
	<c:set var="flag" value="0" />
	<c:forEach var="e" items="${policyQuery.rows}">
		Policy Id : 
		<c:out value="${e.policyId}" /> <br/>
		Policy Name : 
		<c:out value="${e.policyName}" /> <br/> 
		Policy Type : 
		<c:out value="${e.policyType}" /> <br/> 
		Premium Amount : 
		<c:out value="${e.premiumAmount}" /> <br/>
		Pay Mode : 
		<c:out value="${e.payMode}" /> <br/>
		Term : 
		<c:out value="${e.term}" /> <br/> 
		Installment Amount Per Pay Mode : 
		<c:out value="${e.installmentAmountPerPayMode}" /> <br/>
		Matured Amount : 
		<c:out value="${e.maturedAmount}" /> <br/>
		<c:set var="flag" value="1" />
	</c:forEach>
	<c:if test="${flag==0}">
		<c:out value="Policy Id Not Found..." />
	</c:if>
</c:if>

</body>
</html>