<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="post-detail d-flex justify-content-center">
	<div class="contents">
		<div class="contents-images">
		<img src="https://purplejam.kr/content/images/2020/05/01-4.jpg">
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
				<input type="button" class="addBtn" value="게시">
			</div>
		</div>
	</div>
</section>

<script>
	$(document).ready(function() {
		console.log(data)
		
	})
</script>