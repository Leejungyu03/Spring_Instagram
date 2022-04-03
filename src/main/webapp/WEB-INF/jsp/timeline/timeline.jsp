<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="timeline">
	<c:forEach items="${cardViewList}" var="cardView">
		<div class="timeline-contents">
			<div class="timeline-head d-flex">
				<div class="profile"><img src="/image/timeline/profile.png"></div> 
				<div class="userName">${cardView.post.userName}</div>
				<c:if test="${cardView.user.id eq userId}">
					<div class="option"><img class="deleteBtn" src="/image/timeline/option.png" data-post-id="${cardView.post.id}"></div>				
				</c:if>
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
				
				<jsp:useBean id="nowDate" class="java.util.Date" />
				<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" var="today" integerOnly="true" scope="request"/>
				<fmt:parseNumber value="${cardView.post.createdAt.time / (1000*60*60*24)}" integerOnly="true" scope="request" var="commentDate"/>

				<c:choose>
					<c:when test="${(today - commentDate) eq 0}">
						<div class="time">오늘</div>
					</c:when>
					<c:otherwise>
						<div class="time">${today - commentDate}일전</div>
					</c:otherwise>
				</c:choose>
				
				<c:set value="${fn:length(cardView.commentList)}" var="commentListLength"/>
				<c:set value="${cardView.commentList[commentListLength - 1].comment.userName}" var="recentCommentUserName"/>
				<c:set value="${cardView.commentList[commentListLength - 1].comment.comment}" var="recentCommentComment"/>
				<c:if test="${!empty recentCommentComment}">
					<div class="postComment">
						<b>${recentCommentUserName}</b>
						 : ${recentCommentComment}
					</div>
				</c:if>
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
		
		$('.deleteBtn').on('click', function(e) {
			
			let postId = $(this).data('post-id');
			
			$.ajax({
				type : "DELETE",
				url : "/post/delete",
				data : {"postId" : postId},
				success : function(data) {
					if (data.result == "success") {
						alert("삭제완료")
						location.reload();
					} else {
						alert("삭제실패")
					}
				},
				error : function() {
					alert("에러, 관리자에게 문의하세요")
				}
			});
		});
	});
</script>