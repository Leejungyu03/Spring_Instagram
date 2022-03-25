package com.instagram.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.instagram.post.bo.PostBO;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/post_create_view")
	public String postListView(Model model, HttpServletRequest request) {
		// 세션에 지금 로그인 되었는지  -> 비로그인 : 로그인 페이지로 리다이렉트
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");  // 비로그인일때 Null 이기 때문에 int가 아닌 Integer
		
		if (userId == null) {	// 비로그인 일때
			return "redirect:/user/sign_in_view";
		}
		
		model.addAttribute("viewName", "post/post_create");
		
		return "template/layout";
	}
	
	@RequestMapping("/post_detail_view")
	public String postDetailView(Model model) {
		
		model.addAttribute("viewName", "/post/post_detail");
		
		return "template/layout";
		
	}
}