package ua.service.Implementation;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.dto.filter.BasicFilter;
import ua.dto.form.DepositForm;
import ua.entity.Deposit;
import ua.repository.DepositRepository;
import ua.service.DepositService;
import ua.service.FileWriter;
import ua.service.Specification.DepositSpecifiaction;

@Service
public class DepositServiceImpl implements DepositService {

	@Autowired
	private DepositRepository repository;

	@Autowired
	private FileWriter fileWriter;

	@Override
	@Transactional(readOnly = true)
	public List<Deposit> findAll() {
		return repository.findAll();
	}

	@Override
	public void save(DepositForm form) {

		Deposit deposit = new Deposit();

		deposit.setId(form.getId());
		deposit.setDepositSum(Integer.valueOf(form.getDepositSum()));
		deposit.setDateOfDeposit(LocalDate.parse(form.getDateOfDeposit()));
		deposit.setProject(form.getProject());
		

		repository.save(deposit);

	}

	@Override
	public void delete(int id) {
		repository.delete(id);

	}

	@Override
	public Page<Deposit> findAll(BasicFilter filter, Pageable pageable) {
		return repository.findAll(new DepositSpecifiaction(filter), pageable);
	}

	@Override
	public DepositForm findForm(int id) {
		DepositForm form = new DepositForm();
		form.setId(repository.findOne(id).getId());
		form.setDepositSum(String.valueOf(repository.findOne(id)
				.getDepositSum())); // стрінг
		form.setDateOfDeposit(String.valueOf(repository.findOne(id)
				.getDateOfDeposit())); // стрінг
		form.setProject(repository.findOne(id).getProject());

		return form;
	}

}
