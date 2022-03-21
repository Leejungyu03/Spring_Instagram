<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="sign_up">
	<div class="input">
		<h1>Instagram</h1>
		<div><span>친구들의 사진과 동영상을 보려면 가입하세요.</span></div>
		<form method="POST" action="/user/sign_up">
			<input type="text" class="loginId" name="loginId" placeholder="아이디를 입력하세요">
			<button type="button" id="loginIdCheckBtn" class="btn-success">중복확인</button><br>
					
			<input type="text" class="password input-text" name="password" placeholder="비밀번호를 입력하세요">
					
			<input type="text" class="passwordCheck input-text" name="passwordCheck" placeholder="비밀번호를 확인">
					
			<input type="text" class="name input-text" name="name" placeholder="이름을 입력하세요">
					
			<input type="text" class="email input-text" name="email" placeholder="이메일을 입력하세요">
				
			<input type="button" class="btn-primary" value="가입">
		</form>
	</div>
	<div class="login">
			계정 있으신가요?
		<a href="#">로그인</a>
	</div>
</section>

<script>
	
</script>