package ua.service.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;


import org.springframework.data.jpa.domain.Specification;

import ua.dto.filter.BasicFilter;
import ua.entity.Deposit;

public class DepositSpecifiaction implements Specification<Deposit> {

	
	
private final BasicFilter filter;
	
	public DepositSpecifiaction(BasicFilter filter) {
		this.filter = filter;
	}


	@Override
	public Predicate toPredicate(Root<Deposit> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		if(!query.getResultType().equals(Long.class)){
			root.fetch("project");
		}
		if(filter.getSearch().isEmpty()) return null;
		return cb.like(root.get("depositSum"), filter.getSearch()+"%");
	
	}
	
	
	
	
}
