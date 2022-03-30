package com.instagram.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.comment.dao.CommentDAO;
import com.instagram.comment.model.Comment;
import com.instagram.comment.model.CommentView;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, String userName, int postId, String comment) {
		return commentDAO.insertComment(userId, userName, postId, comment);
	}
	
	public List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	public List<CommentView> generateCommentViewList(int postId) {
		List<CommentView> resultList = new ArrayList<>();
		List<Comment> commentList = getCommentListByPostId(postId);
		
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			// 댓글
			commentView.setComment(comment);
			
			// 댓 글쓴이
			User user = userBO.getUserByUserId(comment.getUserId());
			commentView.setUser(user);
			
			resultList.add(commentView);
		}
		return resultList;
	}
}
