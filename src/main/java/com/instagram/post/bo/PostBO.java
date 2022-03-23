package com.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.post.dao.PostDAO;
import com.instagram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public int addPost(String loginId, int userId, String content) {
		
		String imagePath = null;
		
		
		return 0;
	}

}
