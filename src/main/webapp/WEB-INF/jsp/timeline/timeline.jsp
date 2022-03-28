<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section class="timeline">
	<c:forEach items="${postList}" var="post">
		<div class="timeline-contents">
			<div class="timeline-head d-flex">
				<div class="profile"><img src="/image/timeline/profile.png"></div> 
				<div class="userName">${post.userName}</div>
				<div class="option"><img src="/image/timeline/option.png"></div>
			</div>
			<div class="timeline-image">
				<img src="${fn:split(post.imagePath, ',')[0]}">
			</div>
			<div class="timeline-comment">
				<div class="d-flex">
				<c:choose>
				<c:when test="true">
					<img class="no-like" src="/image/timeline/Noheart.png">
				</c:when>
				<c:otherwise>
					<img class="like" src="/image/timeline/heart.png">
				</c:otherwise>
				</c:choose>
					<div class="like-number">좋아요 <b>10개</b></div>
				</div>
				<div class="content">${post.content}</div>
				<div class="time">5일 전</div>
				<div>
					<div><b>ㅁㅁ</b> : ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</div>
				</div>
				<div class="detail"><a href="/post/post_detail_view?postId=${post.id}" class="text-dark" data-post-id = "${post.id}">게시물 자세히 보기</a></div>
			</div>
		</div>
	</c:forEach>
</section>

<script>
	var data = '<c:out value="${postList.get(1).content}"/>'
	$(document).ready(function() {
		
		
		// 좋아요를 눌렀을때
		$('.no-like').on('click', function(e) {
			
		});
		// 좋아요를 해제했을 때
		$('.like').on('click', function(e) {
			
			
		});
	});
</script>