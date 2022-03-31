<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="post-detail d-flex justify-content-center">
	<div class="contents">
		<div class="contents-images">
			<img id="contents-img" src="${fn:split(post.imagePath, ',')[0]}">
		</div>
		<div class="contents-comment">
			<div class="head d-flex">
				<img src="/image/timeline/profile.png">
				<div>${post.userName}</div>
			</div>
			<div class="comments">
				<c:forEach items="${commentList}" var="comment">
					<div class="commentCard">
						<div>
							<img src="/image/timeline/profile.png">
							<span class="userName">${comment.userName}</span>
						</div>
						<div class="commentText">${comment.comment}</div>
						
						<jsp:useBean id="nowDate" class="java.util.Date" />
						<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" var="today" integerOnly="true" scope="request"/>
						<fmt:parseNumber value="${comment.createdAt.time / (1000*60*60*24)}" integerOnly="true" scope="request" var="commentDate"/>

						<c:choose>
							<c:when test="${(today - commentDate) eq 0}">
								<div class="time">오늘</div>
							</c:when>
							<c:otherwise>
								<div class="time">${today - commentDate}일 전</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			<div class="addComment d-flex">
				<input type="text" class="comment form-control" maxlength="20" placeholder="댓글을 입력하세요(최대20자)">
				<input type="button" id="addBtn" data-post-id="${post.id}" value="게시">
			</div>
			<button class="next">next</button>
			<button class="prev">prev</button>
			<div><a href="/timeline/timeline_view">타임라인으로</a></div>
		</div>
	</div>
</section>

<script>
	$(document).ready(function() {
		var imageList = [];
		var currentIndex = 0;
		
		imageList = [
			"${fn:split(post.imagePath, ',')[0]}",
			"${fn:split(post.imagePath, ',')[1]}",
			"${fn:split(post.imagePath, ',')[2]}",
			"${fn:split(post.imagePath, ',')[3]}",
			"${fn:split(post.imagePath, ',')[4]}",
			"${fn:split(post.imagePath, ',')[5]}"
			];
		
		for (let i = 0; i < 7; i++) {
			if (imageList[i] == "") {
				imageList.splice(i, 5);
			}
		}
		if (currentIndex == 0) {
			$('.prev').hide()
		}
		
		$('#addBtn').on('click', function(e) {
			e.preventDefault();
			let comment = $('.comment').val().trim()
			if (comment == '') {
				alert("댓글 내용을 작성해주세요");
				return;
			}
			
			let postId = $(this).data('post-id');
			
			
			$.ajax({
				type : "POST",
				url : "/comment/create",
				data : {"postId" : postId, "comment" : comment},
				success : function(data) {
					if (data.result == "success") {
						alert("댓글이 추가되었습니다.");
						location.reload();
					} else {
						alert(data.error_message)
					}
				},
				error : function(e) {
					alert("실패했습니다. 관리자에게 문의하세요")
					console.log(e)
				}
			});
		});
		
		
		$('.next').on('click', function() {
			currentIndex++;
			$('#contents-img').attr('src', imageList[currentIndex]);
			if (imageList.length - 1 == currentIndex) {
				$('.next').hide()
			} else {
				$('.next').show()
			}
			
			if (currentIndex != 0) {
				$('.prev').show()
			}
		});
		
		$('.prev').on('click', function() {
			currentIndex--;
			$('#contents-img').attr('src', imageList[currentIndex]);
			if (currentIndex == 0) {
				$('.next').show()
				$('.prev').hide()
			}
			if (currentIndex != imageList.length - 1) {
				$('.next').show()
			}
		});
	})
</script>