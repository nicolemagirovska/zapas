package ua.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ua.dto.filter.BasicFilter;
import ua.dto.form.ProjectForm;
import ua.entity.Project;

public interface ProjectService {
	ProjectForm findOne(int id);
	Project findEntity(int id);
	List<Project> findAll();
	void save (ProjectForm project);
	void delete(int id);
	
	Project findOne(String name);

	Page<Project> findAll(BasicFilter filter, Pageable pageable);
	ProjectForm findForm(int id);
}
