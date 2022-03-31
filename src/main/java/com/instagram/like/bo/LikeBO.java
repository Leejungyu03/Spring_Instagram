package com.instagram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public void like(int postId, Integer userId) {
		boolean existLike = existLike(postId, userId);
		if (existLike) {
			likeDAO.deleteLikeByPostIdUserId(postId, userId);
		} else {
			likeDAO.insertLike(postId, userId);
		}
	}
	
	public int getLikeCountByPostID(int postId) {
		return likeDAO.selectLikeCountByPostID(postId);
	}
	
	public boolean existLike(int postId, Integer userId) {
		
		if (userId == null) {
			return false;
		}
		
		int likeCount = likeDAO.selectLikeCountByPostIdOrUserId(postId, userId);
		
		if (likeCount < 1) {
			return false;
		}
		
		return true;
	}
}
