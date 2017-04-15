package ua.service;
import org.springframework.web.multipart.MultipartFile;

public interface FileWriter {

	enum Folder{
		PROJECT, DEPOSIT
	}
	
	boolean write(Folder folder, MultipartFile file, int id);
}