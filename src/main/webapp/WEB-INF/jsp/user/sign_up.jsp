<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="sign_up">
	<div class="input">
		<h1>Instagram</h1>
		<div><span>친구들의 사진과 동영상을 보려면 가입하세요.</span></div>
		<form id="signUpForm" method="POST" action="/user/sign_up">
		<div class="d-flex">
			<input type="text" id="loginId" class="loginId form-control" name="loginId" placeholder="아이디를 입력하세요">
			<button type="button" id="loginIdCheckBtn" class="btn btn-success">중복확인</button><br>		
		</div>
			<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
			<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
			<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
					
			<input type="password" id="password" class="password input-text form-control" name="password" placeholder="비밀번호를 입력하세요">
					
			<input type="password" id="confirmPassword" class="passwordCheck input-text form-control" placeholder="비밀번호를 확인">
					
			<input type="text" id="name" class="name input-text form-control" name="name" placeholder="이름을 입력하세요">
					
			<input type="text" id="email" class="email input-text form-control" name="email" placeholder="이메일을 입력하세요">
				
			<input type="button" id="signUpBtn" class="btn-primary btn" value="가입">
		</form>
	</div>
	<div class="login">
			계정 있으신가요?
		<a href="/user/sign_in_view">로그인</a>
	</div>
</section>

<script>
	$(document).ready(function() {
		
		$('#loginIdCheckBtn').on('click', function(e) {
			
			let loginId = $('#loginId').val().trim();
			
			// 경고 문구 초기화
			$('#idCheckLength').addClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			
			if (loginId.length < 4){
				$('#idCheckLength').removeClass('d-none');
				return;
			}
			
			$.ajax({
				url : "/user/is_duplicated_id",
				data : {"loginId" : loginId },
				success : function(data) {
					if (data.result) {
						$('#idCheckDuplicated').removeClass('d-none');
					} else {
						$('#idCheckOk').removeClass('d-none');
					}
				},
				error : function(e) {
					alert("아이디 중복확인에 실패했습니다.");
					console.dir(e);
				}
			});
		});
		
		// 회원가입
		$('#signUpBtn').on('click', function() {
			
			let loginId = $('#loginId').val().trim();
			if (loginId == '') {
				alert("아이디를 입력해주세요");
				return;
			}
			
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			if (password == '' || confirmPassword == '') {
				alert("비밀번호를 입력해주세요");
				return;
			}
			
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				// 텍스트 박스 값을 초기화 한다.
				$('#password').val('');
				$('#confirmPassword').val('');
				return;
			}
			
			let name = $('#name').val().trim();
			if (name == '') {
				alert("이름을 입력하세요.");
				return;
			}
			
			let email = $('#email').val().trim();
			if (email == '') {
				alert("이메일 주소를 입력하세요.");
				return;
			}
			
			// 아이디 중복확인이 완료 되었는지 확인
			if ($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 다시 해주세요.");
				return;
			}
			
			// 회원가입 서버 요청			
			let url = $('#signUpForm').attr('action'); // form에 있는 action 주소 가져오기
			let params = $('#signUpForm').serialize(); // 폼태그에 있는 값들을 한번에 보낼 수 있게 한다.
			
			$.post(url, params)
			.done(function(data) {
				if (data.result == "success") {
					alert("가입을 환영합니다! 로그인을 해주세요.");
					location.href = "/user/sign_in_view";
				} else {
					alert("가입에 실패했습니다. 다시 시도해주세요");
				}
			});
		});
		
	});
</script>