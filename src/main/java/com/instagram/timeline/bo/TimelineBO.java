package com.instagram.timeline.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.comment.bo.CommentBO;
import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;
import com.instagram.timeline.model.CardView;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@Service
public class TimelineBO {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	private List<CardView> generateCardViewList(Integer userId) {
		List<Post> postList = postBO.getPostList();
		for (Post post : postList) {
			CardView card = new CardView();
			
			// 글 정보
			card.setPost(post);
			
			// 글쓴이 정보
			User user = userBO.getUserByUserId(post.getUserId());
			
			// 댓글들 정보
			List<CommentView> commentList = commentBO.
		}
	}
}
