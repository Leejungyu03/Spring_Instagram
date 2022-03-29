package com.instagram.timeline.model;

import com.instagram.comment.model.Comment;
import com.instagram.post.model.Post;
import com.instagram.user.model.User;

public class CardView {
	// 게시글
	private Post post;
	
	// 댓글들
	private Comment comment;
	
	// 좋아요 수
	
	// 로그인 된 사용자가 좋아요 누름 여부
	
	// 글쓴이 정보
	private User user;
	

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
