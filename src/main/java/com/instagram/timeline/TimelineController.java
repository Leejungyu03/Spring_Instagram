package com.instagram.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/timeline_view")
	public String timelineView(Model model, HttpServletRequest request) {
		
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList", postList);
		model.addAttribute("viewName", "timeline/timeline");
		
		return "template/layout";
	}
}
