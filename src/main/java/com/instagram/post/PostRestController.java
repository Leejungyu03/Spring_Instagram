package com.instagram.post;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("content") String content,
			@RequestParam("file") List<MultipartFile> file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userLoginId = (String) session.getAttribute("userLoginId");
		
		int row = postBO.addPost(userLoginId, userId, userName, content, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		if (row < 1) {
			result.put("result", "error");
			result.put("error_message", "게시물 저장에 실패하였습니다.");
		}
		
		
		return result;
	}
}
