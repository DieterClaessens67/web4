<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header role="banner">
<img alt="Books" src="images/featured_chatroom.jpg">
<h1><span>Chat App</span></h1>
<nav>
<ul>
<c:choose>
<c:when test="${user==null}">
<li><a href="Controller">Home</a></li>
</c:when>
<c:otherwise>
<li><a href="Controller">Home</a></li>
<li><a href="Controller?action=ShowChat">Chat</a> </li>
</c:otherwise>
</c:choose>


</ul>
</nav>
<h2>
${param.title}
</h2>
    <c:if test="${param.title.equalsIgnoreCase('Chat')}">
        <p id="status" style="text-align: right">Status: ${statusUser}</p>
    </c:if>
</header>