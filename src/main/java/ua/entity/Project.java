package ua.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Project")
public class Project extends AbstractEntity{
	
	@Column(name="author")
	private String author;
	
	
	private int version;
	
	@Column(name="name")
	private String name;
	
	@Column(name="shortDescription")
	private String ShortDescription;
	@Column(name="fullDescription")
	private String FullDescription;
	@Column(name="sumNeeded")
	private int SumNeeded;
	@Column(name="sumCollected")
	private int SumCollected;
	
	@Column(name="dateOfApplication")
	private LocalDate dateOfApplication;
	@Column(name="deadline")
	private LocalDate deadline;
	
	
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public int getSumCollected() {
		return SumCollected;
	}
	public void setSumCollected(int sumCollected) {
		SumCollected = sumCollected;
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
	public int getSumNeeded() {
		return SumNeeded;
	}
	public void setSumNeeded(int sumNeeded) {
		SumNeeded = sumNeeded;
	}
	public LocalDate getDateOfApplication() {
		return dateOfApplication;
	}
	public void setDateOfApplication(LocalDate dateOfApplication) {
		this.dateOfApplication = dateOfApplication;
	}
	public LocalDate getDeadline() {
		return deadline;
	}
	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}
	public List<Deposit> getDeposites() {
		return deposites;
	}
	public void setDeposites(List<Deposit> deposites) {
		this.deposites = deposites;
	}
	@OneToMany(mappedBy = "project")
	private List<Deposit> deposites = new ArrayList<Deposit>();





	

}
