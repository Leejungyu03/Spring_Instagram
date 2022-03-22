<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="sign-in d-flex">
	<div class="banner">
		<div class="banner-image"><img id="bannerImage" src="/images/sign_in/banner1.png"></div>
	</div>
	<div>
		<div class="input">
			<h1>Instagram</h1>
			
			<form id="signInForm" method="POST" action="/user/sign_in">
				<input type="text" id="loginId" name="loginId" class="input-text form-control" placeholder="아이디">
				
				<input type="password" id="loginPassword" name="password" class="input-text form-control" placeholder="비밀번호">
				
				<input type="submit" id="signInBtn" class="btn-primary btn" value="로그인">	
			</form>
		</div>
		<div class="no-account">
			<div>계정이 없으신가요?
			<a href="/user/sign_up_view">가입하기</a></div>
		</div>
	</div>
</section>

<script>
	$(document).ready(function() {
		
		$('#signInForm').submit(function(e) {
			e.preventDefault();
			
			let loginId = $('#loginId').val().trim();
			if (loginId == '') {
				alert("아이디를 입력해주세요");
				return;
			}
			
			let loginPassword = $('#loginPassword').val();
			if (loginPassword == '') {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			let url = $(this).attr("action");
			let data = $(this).serialize(); // form의 name 속성으로 data 구성
			
			$.post(url, data)
			.done(function(data) {
				if (data.result == "success") {
					alert(data.name + "님 환영합니다");
					location.href = "/timeline/timeline_view";
				} else {
					alert("로그인에 실패하였습니다. 다시 시도해주세요.");
				}
			});
		});
		
		
		let bannerList = ["/images/sign_in/banner2.png", "/images/sign_in/banner3.png", "/images/sign_in/banner4.png", "/images/sign_in/banner1.png"];
		let currentimageIndex = 0;
		
		setInterval(function() {
			$('#bannerImage').attr("src", bannerList[currentimageIndex]);
			currentimageIndex++;
			
			if (currentimageIndex == bannerList.length) {
				currentimageIndex = 0;
			}
		}, 5000);
	});
</script>