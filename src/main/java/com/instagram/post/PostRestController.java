package com.instagram.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;

@RequestMapping("/post")
@RestController
public class PostRestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("content") String content,
			MultipartHttpServletRequest request) {
		
		
		List<MultipartFile> files = request.getFiles("files");
		
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userLoginId = (String) session.getAttribute("userLoginId");
		
		int row = postBO.addPost(userLoginId, userId, userName, content, files);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		if (row < 1) {
			result.put("result", "error");
			result.put("error_message", "게시물 저장에 실패하였습니다.");
		}
		
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId) {
		
		int row = postBO.deletePost(postId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		if (row < 0) {
			result.put("result", "error");
		} 
		
		return result;
	}
}