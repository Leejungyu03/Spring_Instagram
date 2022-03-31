<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section class="timeline">
	<c:forEach items="${cardViewList}" var="cardView">
		<div class="timeline-contents">
			<div class="timeline-head d-flex">
				<div class="profile"><img src="/image/timeline/profile.png"></div> 
				<div class="userName">${cardView.post.userName}</div>
				<div class="option"><img src="/image/timeline/option.png"></div>
			</div>
			<div class="timeline-image">
				<img src="${fn:split(cardView.post.imagePath, ',')[0]}">
			</div>
			<div class="timeline-comment">
				<div class="d-flex">
				<c:choose>
				<c:when test="${cardView.filledLike}">
					<img class="like" src="/image/timeline/heart.png" data-post-id="${cardView.post.id}">
				</c:when>
				<c:otherwise>
					<img class="like" src="/image/timeline/Noheart.png" data-post-id="${cardView.post.id}">
				</c:otherwise>
				</c:choose>
					<div class="like-number">좋아요 <b>${cardView.likeCount}</b></div>
				</div>
				<div class="content">${cardView.post.content}</div>
				<div class="time">${cardView.post.createdAt}</div>
				<c:set value="${fn:length(cardView.commentList)}" var="commentListLength"/>
				<c:set value="${cardView.commentList[commentListLength - 1].comment.userName}" var="recentCommentUserName"/>
				<c:set value="${cardView.commentList[commentListLength - 1].comment.comment}" var="recentCommentComment"/>
				<div>
					<div><b>${recentCommentUserName}</b> : ${recentCommentComment}</div>
				</div>
				<div class="detail"><a href="/post/post_detail_view?postId=${cardView.post.id}" class="text-dark" data-post-id = "${cardView.post.id}">게시물 자세히 보기</a></div>
			</div>
		</div>
	</c:forEach>
</section>

<script>
	$(document).ready(function() {
		
		
		// 좋아요를 눌렀을때
		$('.like').on('click', function(e) {
			
			let postId = $(this).data('post-id');
			
			$.ajax({
				type : "POST",
				url : "/like",
				data : {"postId" : postId},
				success : function(data) {
						location.reload();
				},
				error : function() {
					alert("에러, 관리자에게 문의하세요")
				}
			});
		});
	});
</script>