package com.instagram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.instagram.comment.bo.CommentBO;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, Object> createComment(
			@RequestParam("postId") int postId,
			@RequestParam("comment") String comment,
			HttpSession session) {
		
		int userId = (int) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		int row = commentBO.addComment(userId, userName, postId, comment);
		
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("error_message", "댓글 등록에 실패하였습니다.");
		}
		
		return result;
	}
}
