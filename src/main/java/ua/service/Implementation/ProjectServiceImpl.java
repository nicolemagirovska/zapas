package ua.service.Implementation;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.dto.filter.BasicFilter;
import ua.dto.form.ProjectForm;
import ua.entity.Project;
import ua.repository.ProjectRepository;
import ua.service.FileWriter;
import ua.service.FileWriter.Folder;
import ua.service.ProjectService;
import ua.service.Specification.ProjectSpecification;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectRepository repository;

	@Autowired
	private FileWriter writer;

	@Override
	@Transactional(readOnly = true)
	public ProjectForm findOne(int id) {
		Project project = repository.findOne(id);
		ProjectForm form = new ProjectForm();
		form.setId(project.getId());
		form.setName(project.getName());
		form.setAuthor(project.getAuthor());
		form.setDateOfApplication(String.valueOf(project.getDateOfApplication()));
		form.setDeadline(String.valueOf(project.getDeadline()));
		form.setSumNeeded(String.valueOf(project.getSumNeeded()));
		form.setSumCollected(String.valueOf(project.getSumCollected()));
		form.setFullDescription(project.getFullDescription());
		form.setShortDescription(project.getShortDescription());
		return form;

	}

	@Override
	@Transactional(readOnly = true)
	public List<Project> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional
	public void save(ProjectForm form) {
		Project project = new Project();
		project.setId(form.getId());
		project.setName(form.getName());
		project.setAuthor(form.getAuthor());
		project.setDateOfApplication(LocalDate.parse(form
				.getDateOfApplication()));
		project.setDeadline(LocalDate.parse(form.getDeadline()));
		project.setFullDescription(form.getFullDescription());
		project.setShortDescription(form.getShortDescription());
		project.setSumCollected(Integer.valueOf(form.getSumCollected()));
		project.setSumNeeded(Integer.valueOf(form.getSumNeeded()));
		project.setVersion(form.getVersion());
		project = repository.saveAndFlush(project);
		if (writer.write(Folder.PROJECT, form.getFile(), project.getId())) {
			project.setVersion(project.getVersion() + 1);
			repository.save(project);
		}

	}

	@Override
	public void delete(int id) {
		repository.delete(id);

	}

	@Override
	public Project findOne(String name) {
		return repository.findByName(name);
	}

	@Override
	public Page<Project> findAll(BasicFilter filter, Pageable pageable) {
		return repository.findAll(new ProjectSpecification(filter), pageable);
	}

	@Override
	public Project findEntity(int id) {
		return repository.findOne(id);
	}

	@Override
	public ProjectForm findForm(int id) {
		ProjectForm form = new ProjectForm();
		Project project = repository.findOne(id);
		form.setAuthor(project.getAuthor());
		form.setDateOfApplication(String.valueOf(project.getDateOfApplication()));
		form.setDeadline(String.valueOf(project.getDeadline()));
		form.setFullDescription(project.getFullDescription());
		form.setId(project.getId());
		form.setName(project.getName());
		form.setShortDescription(project.getShortDescription());
		form.setSumCollected(String.valueOf(project.getSumCollected()));
		form.setSumNeeded(String.valueOf(project.getSumNeeded()));
		form.setVersion(project.getVersion());
		return form;
	}
}
