<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<div class="row">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/admin/project">Projects</a></li>
					<li><a href="/admin/deposit">Make a deposit</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<div class="row">
<div class="col-md-3 col-xs-12">
		<form:form modelAttribute="filter" action="/admin/project" method="get" class="form-inline">
			<div class="form-group">
				<form:input path="search" placeholder="search" class="form-control" />
				<custom:hiddenInputs excludeParams="search"/>
				<button type="submit" class="btn btn-primary">Ok</button>
			</div>
		</form:form>
		<br>
					<div class="col-md-10 col-xs-12">
		<div class="row">
		<div class="col-md-6 col-xs-6 text-center">
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Sort <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<custom:sort innerHtml="Name asc" paramValue="name"/>
						<custom:sort innerHtml="Name desc" paramValue="name,desc"/>
					</ul>
				</div>
			</div>
						<div class="col-md-6 col-xs-6 text-center">
				<custom:size posibleSizes="1,2,5,10" size="${page.size}" />
			</div>
		</div>
	</div>
	</div>




	
	<div class="col-md-7 col-xs-12">			
				<form:form class="form-horizontal" action="/admin/project" method="POST" modelAttribute="project"  enctype="multipart/form-data">
				
				<form:errors path="*"/>
				<custom:hiddenInputs excludeParams="author, dateOfApplication, deadline, fullDescription, name, shortDescription, sumNeeded, sumCollected"/>
				
				
					<div class="form-group">
						<label for="name" class="col-sm-offset-2 col-sm-10"><form:errors path="name"/></label>
					</div>
						
					<div class="row">
    					<label for="project" class="col-md-3 control-label">Project name</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="name" id="name"/>
    					</div>
  										  					  		
						<label for="project" class="col-md-3 control-label">Date Of Application</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="dateOfApplication" id="dateOfDeposit"/>
    					</div>
    					
    					<label for="project" class="col-md-3 control-label">Deadline</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="deadline" id="sumOfDeposit"/>
    					</div>
  				
  						<label for="project" class="col-md-3 control-label">Author</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="author" id="sumOfDeposit"/>
    					</div>
    					
  						<label for="project" class="col-md-3 control-label">Short description</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="shortDescription" id="sumOfDeposit"/>
    					</div>
  					
  					    <label for="project" class="col-md-3 control-label">Full description</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="fullDescription" id="sumOfDeposit"/>
    					</div>
  				
  					 	<label for="project" class="col-md-3 control-label">Sum needed</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="sumNeeded" id="sumOfDeposit"/>
    					</div>
  				
  					    <label for="project" class="col-md-3 control-label">Sum Collected</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="sumCollected" id="sumOfDeposit"/>
    					</div>
  						</div>		
  						
  							<div class="row">
  						<br>
  						<div class="col-md-3"></div>
  						<div class="col-md-2">
		  					<label class="btn btn-default btn-file">
		        				Browse <input type="file" name="file" style="display: none;">
		    				</label>
		    				</div>
		    				<div class="col-md-2">
		    				<button type="submit" class="btn btn-default">Create</button>
	    				</div>	
	    				
  				</div>
  			</form:form>
			</div>
		
	<div class="col-md-12 col-xs-12">
	

			
  						
  					
		<div class="row">
		    <div class="col-xs-1 col-xs-1"><h5>Image</h5></div>
		    <div class="col-xs-1 col-xs-1"><h5>Project name</h5></div>
		    <div class="col-xs-1 col-xs-1"><h5>Author</h5></div>
		    <div class="col-xs-1 col-xs-1"><h5>Short Descr</h5></div>
		   	<div class="col-xs-1 col-xs-1"><h5>Full Descr</h5></div>
		   	<div class="col-xs-1 col-xs-1"><h5>Sum Needed</h5></div>
		   	<div class="col-xs-1 col-xs-1"><h5>Sum Collected</h5></div>
		    <div class="col-xs-1 col-xs-1"><h5>Date of application</h5></div>
		    <div class="col-xs-1 col-xs-1"><h5>Deadline</h5></div>
			<div class="col-xs-1 col-xs-1"><h5>Update</h5></div>
			<div class="col-xs-1 col-xs-1"><h5>Delete</h5></div>
		</div>
			<c:forEach items="${page.content}" var="project">			
				<div class="row">
				    <div class="col-xs-1 col-xs-1"><img class="img-rounded" width="100%" src="/images/project/${project.id}.jpg?version=${project.version}"></div>
				    <div class="col-md-1 col-xs-1">${project.name}</div>
					<div class="col-md-1 col-xs-1">${project.author}</div>
					<div class="col-md-1 col-xs-1">${project.shortDescription}</div>
					<div class="col-md-1 col-xs-1">${project.fullDescription}</div>
					<div class="col-md-1 col-xs-1">${project.sumNeeded}</div>
					<div class="col-md-1 col-xs-1">${project.sumCollected}</div>
				    <div class="col-md-1 col-xs-1">${project.dateOfApplication}</div>
					<div class="col-md-1 col-xs-1">${project.deadline}</div>
					<div class="col-md-1 col-xs-1"><a class="btn btn-warning" href="/admin/project/update/${project.id}">update</a></div>
					<div class="col-md-1 col-xs-1"><a class="btn btn-danger" href="/admin/project/delete/${project.id}">delete</a></div>
				</div>
			</c:forEach>
	</div>
	
	
</div>
<div class="row">
	<div class="col-md-12 col-xs-12 text-center">
		<custom:pageable page="${page}" cell="<li></li>" container="<ul class='pagination'></ul>" />
	</div>
</div>







