package ua.dto.form;

import ua.entity.Project;

public class DepositForm {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String dateOfDeposit;
	private String depositSum;
	private Project project;
	

	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getDateOfDeposit() {
		return dateOfDeposit;
	}
	public void setDateOfDeposit(String dateOfDeposit) {
		this.dateOfDeposit = dateOfDeposit;
	}
	public String getDepositSum() {
		return depositSum;
	}
	public void setDepositSum(String depositSum) {
		this.depositSum = depositSum;
	}

}
