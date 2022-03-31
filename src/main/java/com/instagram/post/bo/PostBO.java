package com.instagram.post.bo;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.common.FileManagerService;
import com.instagram.post.dao.PostDAO;
import com.instagram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public Post getPostListBypostId(int postId) {
		return postDAO.selectPostListBypostId(postId);
	}
	
	public int addPost(String loginId, int userId, String userName, String content, List<MultipartFile> files) {
		
		String imagePath = null;
		if (files != null) {
			try {
				imagePath = fileManagerService.saveFile(loginId, files);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return postDAO.insertPost(userId, userName, content, imagePath);
	}
}