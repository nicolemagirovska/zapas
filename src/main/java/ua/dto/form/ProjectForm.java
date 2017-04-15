package ua.dto.form;

import org.springframework.web.multipart.MultipartFile;

public class ProjectForm {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String author;
	private String name;
	private String ShortDescription;
	private String FullDescription;
	private String SumNeeded;
	private String SumCollected;
	private String dateOfApplication;
	private String deadline;
	private MultipartFile file;
	private int version;
	
	
	
		
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getSumNeeded() {
		return SumNeeded;
	}
	public void setSumNeeded(String sumNeeded) {
		SumNeeded = sumNeeded;
	}
	public String getSumCollected() {
		return SumCollected;
	}
	public void setSumCollected(String sumCollected) {
		SumCollected = sumCollected;
	}
	public String getDateOfApplication() {
		return dateOfApplication;
	}
	public void setDateOfApplication(String dateOfApplication) {
		this.dateOfApplication = dateOfApplication;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShortDescription() {
		return ShortDescription;
	}
	public void setShortDescription(String shortDescription) {
		ShortDescription = shortDescription;
	}
	public String getFullDescription() {
		return FullDescription;
	}
	public void setFullDescription(String fullDescription) {
		FullDescription = fullDescription;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
	
}
