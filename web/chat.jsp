<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:if test="${user.getFriendsCollection() != null}">
        <table id="friendList" align="center">
        </table>
    </c:if>
    <p style="text-align: center">
    <input type="text" id="stat">
    </p>
    <p style="text-align: center">
    <input type="button" id="changeStatus" value="Change Status"/>
    <p style="text-align: center">
        <input type="text" id="friendInput">
    </p>
    <p style="text-align: center">
        <input type="button" id="addFriend" value="Add Friend"/>
    </p>
</section>
<!-- Moet op het einde staan in html, anders kent hij de button nog niet en werkt het niet. -->
<script type="text/javascript" src="js/changeStatus.js"></script>
<script type="text/javascript" src="js/getFriends.js"></script>
<script type="text/javascript" src="js/addFriend.js"></script>
</body>
</html>
