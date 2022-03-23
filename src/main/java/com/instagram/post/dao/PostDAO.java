package com.instagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.post.model.Post;

@Repository
public interface PostDAO {
	
	public List<Post> selectPostList();
	
	public int insertPost(
			@Param("loginId") int userId,
			@Param("content") String content);
}
