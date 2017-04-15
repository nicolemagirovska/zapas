package ua.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ua.dto.form.ProjectForm;


public class ProjectValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(ProjectForm.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "", "Can`t be empty");
			}
	
	
	
	
	
	
	

}
