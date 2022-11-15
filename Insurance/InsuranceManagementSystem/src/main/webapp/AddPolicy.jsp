<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="com.infinite.IMS.PolicyDAO" />
	<form method="get" action="AddPolicy.jsp" style="text-align: center">
			Policy Name : 
			<input type="text" name="policyName" /> <br/><br/> 
			Policy Type :
			<input type="text" name="policyType" /> <br/><br/>
			Premium Amount :
			<input type="number" name="premiumAmount" /> <br/><br/>
			PayMode : 
			<input type="text" name="payMode" /> <br/><br/>
			Term :
			<input type="text" name="term" /> <br/><br/>
			
			<input type="submit" value="Add policy" />
			<br/>
			<c:if test="${param.premiumAmount!= null}">
			<jsp:useBean id="policy" class="com.infinite.IMS.Policy" />
 			  <jsp:setProperty property="*" name="policy"/>
				<c:out value="${dao.addPolicy(policy)}" />
				
				</c:if>
				
		
	</form>
</body>
</html>