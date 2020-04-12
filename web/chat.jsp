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

<button class="open-button" id="open-button">Chat</button>
<div class="chat-popup" id="chatForm">
    <form class="form-container">
        <h1>Chat</h1>
        <h2>
        <label for="chatRecipient">To: </label>
        <select id="chatRecipient">
        </select>
        </h2>
        <div id="messages"></div>
        <label for="msg"><b>Message</b></label>
        <textarea placeholder="Type message.." name="msg" id="msg"required></textarea>

        <button type="button" class="btn" id="sendButton">Send</button>
        <button type="button" class="btn cancel" id="closeChatBox">Close</button>
    </form>
</div>

<div id="sessionStuff">${user.getUserId()}</div>
<!-- Moet op het einde staan in html, anders kent hij de button nog niet en werkt het niet. -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<script type="text/javascript" src="js/changeStatus.js"></script>
<script type="text/javascript" src="js/getFriends.js"></script>
<script type="text/javascript" src="js/addFriend.js"></script>
<script type="text/javascript" src="js/chat.js"></script>
<script type="text/javascript" src="js/message.js"></script>
</body>
</html>
