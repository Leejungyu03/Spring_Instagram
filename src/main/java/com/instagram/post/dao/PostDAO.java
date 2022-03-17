package com.instagram.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.instagram.post.model.Post;

@Repository
public interface PostDAO {
	
	public List<Post> selectPostList();
}
