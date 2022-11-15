<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employ</title>
</head>
<body>
	<form action="UpdatePolicy.jsp">
		Policy Id : 
		<input type="text" name="policyId" /> <br/><br/>
		<input type="submit" value="Search" /> <br/><br/>
	</form>
	
	<c:if test="${param.empno!=null && param.name == null}">
		<sql:setDataSource var="conn" 
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/insurance"
		user="root"
		password="Javed@123"
	/>
	<sql:query var="policyQuery" dataSource="${conn}">
		select * from policydetails where policyId=?
		<sql:param value="${param.policyId}"/>
	</sql:query>
		<c:set var="flag" value="0" />
		<c:forEach var="e" items="${policyQuery.rows}">
		
			<c:set var="policyname" value="${e.policyname }" />
			<c:set var="policytype" value="${e.policytype }" />
			<c:set var="premiumamount" value="${e.premiumamount }" />
			<c:set var="paymode" value="${e.paymode }" />
			<c:set var="term" value="${e.term }" />
			
			<form action="UpdatePolicy.jsp">
				Policy Id :
				<input type="text" name="policyId" value="${param.policyId }" /> <br><br>
				Policy Name :
				<input type="text" name="policyname" value="${policyname }" /><br><br>
				Policy Type :
				<input type="text" name="policytype" value="${policytype }" /><br><br>
				Premium Amount :
				<input type="number" name="premiumamount" value="${premiumamount }" /><br><br>
				Pay Mode:
				<input type="text" name="paymode" value="${paymode }" /><br><br>
				Term :
				<input type="text" name="term" value="${term }" /><br><br>
				<c:set var="flag" value="1" />
				<input type="submit" value="SUBMIT" />
			</form>
		</c:forEach>
		<c:if test="${flag==0}">
			<c:out value="Policy Not Found..." />
		</c:if>
	</c:if>
	
	<c:if test="${param.premiumamount != null}">
		<sql:setDataSource var="conn" 
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/insurance"
		user="root"
		password="Javed@123"
		/>
		
			<c:set var="policyname" value="${param.policyname }" />
			<c:set var="policytype" value="${param.policytype }" />
			<c:set var="premiumamount" value="${param.premiumamount }" />
			<c:set var="paymode" value="${param.paymode }" />
			<c:set var="term" value="${param.term }" />
		
		<sql:update var="policyQuery" dataSource="${conn}">update policydetails set policyname=?, policytype=?, premiumamount=?, paymode=?, term=? where policyId=?
			<sql:param value="${param.policyname }"/>
			<sql:param value="${param.policytype }"/>
			<sql:param value="${param.premiumamount }"/>
			<sql:param value="${param.paymode }"/>
			<sql:param value="${param.term }"/>
		</sql:update>
		
		<jsp:forward page="ShowPolicy.jsp" />
	</c:if>
</body>
</html>