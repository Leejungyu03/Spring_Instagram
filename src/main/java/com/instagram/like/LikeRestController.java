package com.instagram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.instagram.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBo;
	
	@PostMapping("/like")
	public Map<String, Object> addLike(
			@RequestParam("postId") int postId,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			Map<String, Object> result = new HashMap<>();
			result.put("result", "signIn");
			return result;
		}
		
		likeBo.like(postId, userId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
}
