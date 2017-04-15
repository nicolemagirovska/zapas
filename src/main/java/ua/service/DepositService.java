package ua.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ua.dto.filter.BasicFilter;
import ua.dto.form.DepositForm;
import ua.entity.Deposit;

public interface DepositService {
	
	List<Deposit> findAll();
	void save (DepositForm deposit);
	void delete(int id);
	
	
	Page<Deposit> findAll(BasicFilter filter, Pageable pageable);
	DepositForm findForm(int id);
}
