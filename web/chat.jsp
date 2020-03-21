<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17-3-2020
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Chat" />
    </jsp:include>
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Chat" />
</jsp:include>
<section>
    <p style="text-align: center">
    <input type="text" id="stat">
    </p>
    <p style="text-align: center">
    <input type="button" id="changeStatus" value="Change Status"/>
    </p>
</section>
<!-- Moet op het einde staan in html, anders kent hij de button nog niet en werkt het niet. -->
<script type="text/javascript" src="js/changeStatus.js"></script>
</body>
</html>
