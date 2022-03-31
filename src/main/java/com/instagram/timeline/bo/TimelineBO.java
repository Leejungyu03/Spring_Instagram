package com.instagram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.comment.bo.CommentBO;
import com.instagram.comment.model.CommentView;
import com.instagram.like.bo.LikeBO;
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
	
	@Autowired
	private LikeBO likeBO;
	
	public List<CardView> generateCardViewList(Integer userId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 글 List 가져오기
		List<Post> postList = postBO.getPostList();
		for (Post post : postList) {
			CardView card = new CardView();
			
			// 글 정보
			card.setPost(post);
			
			// 글쓴이 정보
			User user = userBO.getUserByUserId(post.getUserId());
			card.setUser(user);
			
			// 댓글들 정보
			List<CommentView> commentList = commentBO.generateCommentViewList(post.getId());
			card.setCommentList(commentList);
			
			// 좋아요 카운트
			card.setLikeCount(likeBO.getLikeCountByPostID(post.getId()));
			
			// 지금 좋아요 눌렀는지 여부
			card.setFilledLike(likeBO.existLike(post.getId(), userId));
			
			cardViewList.add(card);
		}
		
		return cardViewList;
	}
}
