package com.instagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	
	public final static String FILE_UPLOAD_PATH = "D:\\이준규\\6_Spring_Project\\Instagram\\workspace\\images/";
	
	public String saveFile(String loginId, List<MultipartFile> file) throws IOException {
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null;
		}
		
		for (int i = 0; i < file.size(); i++) {
			byte[] bytes = file.get(i).getBytes();
			Path path = Paths.get(filePath + file.get(i).getOriginalFilename());
			Files.write(path, bytes);
			String 
		}
		
		
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
