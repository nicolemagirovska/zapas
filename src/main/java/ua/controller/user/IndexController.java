package ua.controller.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.dto.filter.BasicFilter;
import ua.service.ProjectService;

@Controller
public class IndexController {
	
	@Autowired
	private ProjectService projectService;
		
	
//	@RequestMapping("/")
//	public String index(){
//	
//		return "user-index";
//	}
		
	@RequestMapping("/login")
	public String login(){
		return "user-login";
	}
	
	@RequestMapping("/")
	public String show(Model model, @PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		model.addAttribute("page",projectService.findAll(filter, pageable));
		return "user-index";
	}
	
	@RequestMapping("/nfhjdbjhvd")
	public String project(Model model, @PageableDefault Pageable pageable, @ModelAttribute("filter") BasicFilter filter){
		model.addAttribute("page",projectService.findAll(filter, pageable));
		return "user-nfhjdbjhvd";
	}
	}