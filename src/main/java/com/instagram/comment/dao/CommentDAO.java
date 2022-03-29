package com.instagram.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.comment.bo.Comment;
import com.instagram.comment.bo.List;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId,
			@Param("postId") int postId,
			@Param("comment") String comment);
	
	public List<Comment> generateCommentViewList(int postId);

}
