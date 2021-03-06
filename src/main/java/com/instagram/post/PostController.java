package com.instagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instagram.comment.bo.CommentBO;
import com.instagram.comment.model.Comment;
import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
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
	public String postDetailView(Model model, 
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) {	// 비로그인 일때
			return "redirect:/user/sign_in_view";
		}
		
		Post post = postBO.getPostListBypostId(postId);
		model.addAttribute("post", post);
		
		List<Comment> commentList = commentBO.getCommentListByPostId(postId);
		model.addAttribute("commentList", commentList);
		
		model.addAttribute("viewName", "/post/post_detail");
		
		return "template/layout";
	}
}