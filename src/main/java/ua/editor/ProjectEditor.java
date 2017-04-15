package ua.editor;
import java.beans.PropertyEditorSupport;
import ua.entity.Project;
import ua.service.ProjectService;


public class ProjectEditor extends PropertyEditorSupport {
	
	private final ProjectService service;

	public ProjectEditor(ProjectService service) {
		this.service = service;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Project project = service.findEntity(Integer.valueOf(text));
		setValue(project);
	}

}
