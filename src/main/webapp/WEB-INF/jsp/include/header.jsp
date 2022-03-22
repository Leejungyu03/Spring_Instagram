<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="content d-flex">
		<h2>Instagram</h2>
		<div class="search d-flex">
			<button type="button" class="btn"><img src="/images/timeline/search.png"></button>
			<input type="text" class="search-text form-control">
		</div>
		<a href="/timeline/timeline_view" class="home"><img src="/images/timeline/home.png"></a>
		<a href="#" class="add"><img src="/images/timeline/add.png"></a>
		<c:choose>
			<c:when test="${not empty userName}">
				<span><b>${userName}</b>님 환영합니다 <a href="/user/sign_out">로그아웃</a></span>
		 	</c:when>
		 	<c:otherwise>
				<a href="/user/sign_in_view" class="user"><img src="/images/timeline/user.png"></a>
		 	</c:otherwise>
		</c:choose>
	</div>
</header>