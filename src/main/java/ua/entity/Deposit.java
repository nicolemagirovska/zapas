package ua.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="Deposit")
public class Deposit extends AbstractEntity {
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Project project;
	
	
	private int DepositSum;
	
	private LocalDate dateOfDeposit;

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	
	public int getDepositSum() {
		return DepositSum;
	}

	public void setDepositSum(int depositSum) {
		DepositSum = depositSum;
	}

	public LocalDate getDateOfDeposit() {
		return dateOfDeposit;
	}

	public void setDateOfDeposit(LocalDate dateOfDeposit) {
		this.dateOfDeposit = dateOfDeposit;
	}

}
