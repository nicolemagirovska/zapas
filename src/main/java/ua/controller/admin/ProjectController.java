package ua.controller.admin;

import static org.springframework.web.bind.annotation.RequestMethod.POST;
import static ua.service.utils.ParamBuilder.getParams;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ua.dto.filter.BasicFilter;
import ua.dto.form.ProjectForm;
import ua.service.ProjectService;
import ua.validator.ProjectValidator;

@Controller
@RequestMapping("/admin/project")
@SessionAttributes(names="project")

public class ProjectController {
	

	@Autowired
	private ProjectService projectService;
	
	@ModelAttribute("project")
	public ProjectForm getForm(){
		return new ProjectForm();
	}
	
	@RequestMapping
	public String show(Model model, @PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		model.addAttribute("page",projectService.findAll(filter, pageable));
		return "admin-project";
	}
	
	@ModelAttribute("filter")
	public BasicFilter getFilter(){
		return new BasicFilter();
	}
	
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id,@PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		projectService.delete(id);
		return "redirect:/admin/project"+getParams(pageable, filter);
	}
	
	@RequestMapping("/update/{id}")
	public String update(@PathVariable int id, Model model,@PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		model.addAttribute("page", projectService.findAll(filter, pageable));
		model.addAttribute("project", projectService.findForm(id));

		return "admin-project";
	}
	
	
	@InitBinder("project")
	protected void initBinder(WebDataBinder binder){
	   binder.setValidator(new ProjectValidator());
	}
	
	@RequestMapping(method=POST)
	public String save(@ModelAttribute("project") @Valid ProjectForm project,BindingResult br, SessionStatus status,Model model,@PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		if(br.hasErrors()){
			model.addAttribute("page", projectService.findAll(filter, pageable));
			return "admin-project";
		}
		projectService.save(project);
		status.setComplete();
		return "redirect:/admin/project"+getParams(pageable, filter);
	}

}
