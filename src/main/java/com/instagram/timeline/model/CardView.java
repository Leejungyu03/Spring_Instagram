package com.instagram.timeline.model;

import java.util.List;

import com.instagram.comment.model.CommentView;
import com.instagram.post.model.Post;
import com.instagram.user.model.User;

public class CardView {
	// 게시글
	private Post post;
	
	// 댓글들
	private List<CommentView> commentList;
	
	// 좋아요 수
	private int likeCount;
	
	// 로그인 된 사용자가 좋아요 누름 여부
	private boolean filledLike;
	
	// 글쓴이 정보
	private User user;
	

	
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public boolean isFilledLike() {
		return filledLike;
	}

	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}


	public List<CommentView> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
