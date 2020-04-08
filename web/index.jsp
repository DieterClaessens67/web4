<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="title" value="Home" />
</jsp:include>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
	<main>
<c:if test="${errors.size()>0 }">
	<div class="danger">
		<ul>
			<c:forEach var="error" items="${errors }">
				<li>${error }</li>
			</c:forEach>
		</ul>
	</div>
</c:if> <c:choose>
	<c:when test="${user!=null}">
		<p>Welcome ${user.getFirstName()}!</p>
		<form method="post" action="Controller?action=LogOut">
			<p>
				<input type="submit" id="logoutbutton" value="Log Out">
			</p>
		</form>
	</c:when>
	<c:otherwise>
		<form method="post" action="Controller?action=LogIn">
			<p>
				<label for="email">Your email </label>
				<input type="text" id="email" name="email" value="jan@ucll.be">
			</p>
			<p>
				<label for="password">Your password</label>
				<input type="password" id="password" name="password" value="t">
			</p>
			<p>
				<input type="submit" id="loginbutton" value="Log in">
			</p>
		</form>
	</c:otherwise>
</c:choose>
	<section>
		<div id="comments"></div>
		<p>Was het een interessante projectweek?</p>
			<label for="name">Name</label>
			<input type="text" id="name" name="name">
			<label for="comment">Comment</label>
			<input type="text" id="comment" name="comment">
			<label for="score">Score</label>
			<select id="score">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>
			<input type="button" id="commentButton" value="Ok">
		<div id="comments1"></div>
		<p>Wat ben je van plan om te doen vandaag?</p>
			<label for="name1">Name</label>
		<input type="text" name="name1" id="name1">
		<label for="comment1">Comment</label>
		<input id="comment1" name="comment1" type="text">
		<label for="score1">Score</label>
		<select id="score1">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
		</select>
		<input type="button" id="commentButton1" value="Ok">
		<div id="comments2"></div>
		<p>Naar	welke muziek ben je momenteel aan het luisteren?</p>
		<label for="name2">Name</label>
		<input type="text" id="name2" name="name2">
		<label for="comment2">Comment</label>
		<input type="text" id="comment2" name="comment2">
		<label for="score2">Score</label>
		<select id="score2">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
		</select>
		<input type="button" id="commentButton2" value="Ok">
		<div id="comments3"></div>
		<p>Wat zijn de examenvragen voor het vak Web4?</p>
		<label for="name3">Name</label>
		<input type="text" id="name3" name="name3">
		<label for="comment3">Comment</label>
		<input type="text" id="comment3" name="comment3">
		<label for="score3">Score</label>
			<select id="score3">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>
		<input type="button" id="commentButton3" value="Ok">
		<div id="comments4"></div>
		<p>Wat is jullie favoriete anime?</p>
		<label for="name4">Name</label>
		<input type="text" id="name4" name="name4">
		<label for="comment4">Comment</label>
		<input type="text" id="comment4" name="comment4">
		<label for="score4">Score</label>
		<select id="score4">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
		</select>
		<input type="button" id="commentButton4" value="Ok">
	</section>
	</main>

	<jsp:include page="footer.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
<script type="text/javascript" src="js/comment.js"></script>
</body>
</html>