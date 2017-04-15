package ua.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ua.entity.Deposit;

public interface DepositRepository extends JpaRepository<Deposit, Integer>, JpaSpecificationExecutor<Deposit> {
	@Query("SELECT deposit FROM Deposit deposit LEFT JOIN FETCH deposit.project WHERE deposit.id=:id")
	Deposit findOne(@Param("id")int id);
	
	@Query("SELECT deposit FROM Deposit deposit LEFT JOIN FETCH deposit.project") 
	List<Deposit> findAll(); 

	
	@Query(value="SELECT deposit FROM Deposit deposit LEFT JOIN FETCH deposit.project",
			countQuery="SELECT count(deposit.id) FROM Deposit deposit")
	Page<Deposit> findAll(Pageable pageable);
	
}
