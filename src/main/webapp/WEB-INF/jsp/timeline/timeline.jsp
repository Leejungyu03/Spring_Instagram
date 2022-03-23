<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="timeline">
	<c:forEach items="${postList}" var="post">
		<div class="timeline-contents">
			<div class="timeline-head d-flex">
				<div class="profile"><img src="/images/timeline/profile.png"></div> 
				<div class="userName">${post.userName}</div>
				<div class="option"><img src="/images/timeline/option.png"></div>
			</div>
			<div class="timeline-image">
				<img src="${post.imagePath}">
			</div>
			<div class="timeline-comment">
				<div>${post.content}</div>
			</div>
		</div>
	</c:forEach>
</section>