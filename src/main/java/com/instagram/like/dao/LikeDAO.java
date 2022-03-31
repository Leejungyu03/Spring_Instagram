package com.instagram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public int selectLikeCountByPostIdOrUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId);
	
	public int selectLikeCountByPostID(int postId);
	
	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") Integer userId);
	
	public int deleteLikeByPostIdUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId);;
	
	
}
