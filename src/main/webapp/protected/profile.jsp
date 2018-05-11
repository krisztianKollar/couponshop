<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<jsp:include page="../snippets/head.jsp">
    <jsp:param name="title" value="Profile"/>
</jsp:include>
<body>
<h1>Profile</h1>
<p>Email: <c:out value="${user.email}"/></p>
<p>Password: <c:out value="${user.password}"/></p>
<h2>Coupons</h2>

<ul>
    <c:forEach var="coupon" items="${coupons}">
         <li><a href="coupon?id=<c:out value="${coupon.id}"/>">${coupon.name}</a></li>
    </c:forEach>
</ul>

<h2>Links</h2>
<ul>
    <li><a href="shops">Shops</a></li>
    <li><a href="coupons">Add new coupon</a></li>
</ul>

<jsp:include page="../snippets/logout.jsp"/>
</body>
</html>
