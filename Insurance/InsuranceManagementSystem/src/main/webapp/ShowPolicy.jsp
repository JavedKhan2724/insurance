<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="ext/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
                <jsp:useBean id="beanDAO" class="com.infinite.IMS.PolicyDAO"/>
        
        <table border="5">
        <tr> 
        <th>Policy Id</th>
        <th>PolicyName</th>
        <th>PolicyType</th>
        <th>PremiumAmount</th>
        <th>PayMode</th>
        <th>Term</th>
        <th>InstallmentAmountPerPayMode</th>
        <th>MaturedAmount</th>
        </tr>
        <c:forEach var="pol" items="${beanDAO.showPolicy()}">
        <tr>
        <td>${pol.policyId }</td>
        <td>${pol.policyName}</td>
        <td>${pol.policyType}</td> 
        <td>${pol.premiumAmount}</td> 
        <td>${pol.payMode}</td> 
        <td>${pol.term}</td> 
        <td>${pol.installmentAmountPerPayMode}</td> 
        <td>${pol.maturedAmount}</td> 
        
        </tr>        
        </c:forEach>
        </table>
        
    
</body>
</html>