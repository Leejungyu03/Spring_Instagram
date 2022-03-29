<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			
			</div>
			<div class="addComment d-flex">
				<input type="text" class="comment form-control" maxlength="20" placeholder="댓글을 입력하세요(최대20자)">
				<input type="button" id="addBtn" data-post-id="${post.id}" value="게시">
			</div>
			<button class="next">next</button>
			<button class="prev">prev</button>
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
		
		$('#addBtn').on('click', function() {
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
						href.reload();
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