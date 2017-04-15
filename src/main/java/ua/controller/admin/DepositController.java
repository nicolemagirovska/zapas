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
import ua.dto.form.DepositForm;
import ua.editor.ProjectEditor;
import ua.entity.Project;
import ua.service.DepositService;
import ua.service.ProjectService;

@Controller
@RequestMapping("/admin/deposit")
@SessionAttributes(names="deposit")
public class DepositController {
	
	@Autowired
	private DepositService depositService;
	
	@Autowired
	private ProjectService projectService;
	
	@ModelAttribute("deposit")
	public DepositForm getForm(){
		return new DepositForm();
	}
	
			
	@RequestMapping
	public String show(Model model, @PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		model.addAttribute("page", depositService.findAll(filter, pageable));
		model.addAttribute("projects", projectService.findAll());
		return "admin-deposit";
	}
	
	@ModelAttribute("filter")
	public BasicFilter getFilter(){
		return new BasicFilter();
	}
	

	
	@InitBinder("deposit")
	protected void initBinder(WebDataBinder binder){
	   binder.registerCustomEditor(Project.class, new ProjectEditor(projectService));
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id,@PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		depositService.delete(id);
		return "redirect:/admin/deposit"+getParams(pageable, filter);
		
	}
	


	
	@RequestMapping("/update/{id}")
	public String update(@PathVariable int id,@Valid DepositForm deposit, Model model,@PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		model.addAttribute("page", depositService.findAll(filter, pageable));
		model.addAttribute("deposit", depositService.findForm(id));
		model.addAttribute("projects", projectService.findAll());

		return "admin-deposit";
	}
	
	
	@RequestMapping(method=POST)
	public String save(@ModelAttribute("deposit") @Valid DepositForm deposit,BindingResult br, SessionStatus status,Model model,@PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		System.out.println(System.getProperty("catalina.home"));
		if(br.hasErrors()){
			model.addAttribute("page", depositService.findAll(filter, pageable));
			model.addAttribute("projects", projectService.findAll());

			return "admin-deposit";
		}
		depositService.save(deposit);
		status.setComplete();
		return "redirect:/admin/deposit"+getParams(pageable, filter);
	}
	
	
	
	
	

}
