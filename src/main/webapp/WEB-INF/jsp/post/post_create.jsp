<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="post-create d-flex justify-content-center">
	<div class="create-popup">
		<div class="create-head d-flex">
			<a href="/timeline/timeline_view"><button id="prevBtn" class="btn btn-danger">이전</button></a>
			<div class="head-text">새 게시물 만들기</div>
			<button id="addBtn" class="btn">추가</button>
		</div>
		<div class="create-image">
			<div class="d-flex h-50">
				<div><img class="previewImage" src="/image/post/image_icon.png"></div>
				<div><img class="previewImage" src="/image/post/image_icon.png"></div>
				<div><img class="previewImage" src="/image/post/image_icon.png"></div>
			</div>
			<div class="d-flex h-50">
				<div><img class="previewImage"src="/image/post/image_icon.png"></div>
				<div><img class="previewImage" src="/image/post/image_icon.png"></div>
				<div><img class="previewImage" src="/image/post/image_icon.png"></div>
			</div>
		</div>
		<div class="create-content">
			<div class="d-flex justify-content-center"><textarea id="content" class="form-control" maxlength="80" placeholder="내용을 입력하세요.(최대 80자)"></textarea></div>
			<div class="upload mt-2">
				<label for="file">
					<span class="btn btn-success">사진 업로드</span>
				</label>
				<div id="previewBtn" class="btn btn-info">미리보기</div>
				<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif" multiple>
				<img id="deleteFile" src="/image/post/delete.png">
			</div>
		</div>
	</div>
</section>

<script> 
	$(document).ready(function() {
		var uploadReady = false;
		var deleteImg = false;
		var files;
		
		
		$('#previewBtn').on('click', function(e) {
			files = $('#file')[0].files;
			
			if (files.length > 6) {
				alert("이미지 6개를 초과하지마세요.");
				return;
			}
			if (files.length == 0) {
				alert("이미지를 넣어주세요.");
				return;
			}
			
			for (let i = 0; i < files.length; i++) {
				let file = URL.createObjectURL(files[i]);
				if (i > 2) {
					e.target.parentElement.parentElement.parentElement.children[1].children[1].children[i-3].children[0].src = file;
				} else {
					e.target.parentElement.parentElement.parentElement.children[1].children[0].children[i].children[0].src = file;
				}
			}
			uploadReady = true;	
			deleteImg = false;
		});
		
		$('#addBtn').on('click', function() {
			let content = $('#content').val().trim();
			if (content == '') {
				alert("내용을 입력해주세요.");
				return;
			}
			if (uploadReady == false) {
				alert("미리보기로 확인해주세요");
				return;
			}
			
			if (deleteImg) {
				alert("이미지를 넣어주세요");
			}
			
			let fileName = $('#file').val();
			if (fileName != '') {
				let ext = fileName.split(".").pop().toLowerCase(); // 확장자를 뽑아내고 소문자로 변경
				if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
					alert("gif, png, jpg, jpeg 확장자만 업로드 할 수 있습니다.");
					$('#file').val(''); // 파일을 비운다.
					return;
				}
			}
			
			let formData = new FormData();
			formData.append("content", content);
			
			let files = $('#file')[0].files;
			for (let i = 0; i < files.length; i++) {
				formData.append("files", files[i]);
			}
			
			$.ajax({
				type : "POST",
				url : "/post/create",
				data : formData,
				enctype : "multipart/form-data",
				processData : false,
				contentType : false,
				success : function(data) {
					if (data.result == "success") {
						alert("게시물이 추가되었습니다.");
						location.href = "/timeline/timeline_view";
					} else {
						alert(data.error_message);
					}
				},
				error : function(e) {
					alert("게시물 추가에 실패했습니다. 관리자에게 문의주세요.");
					console.dir(e)
				}
			});
		});
		
		$('#deleteFile').on('click', function() {
			let deleteImage = "/image/post/image_icon.png";
			console.dir($('.previewImage'))
			for (let i = 0; i < 6; i++) {
				$('.previewImage')[i].src = deleteImage;
			}
			deleteImg = true;
		});
	});
</script>