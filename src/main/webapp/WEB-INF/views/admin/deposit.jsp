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
					<li><a href="/admin/project">Projects</a></li>
					<li class="active"><a href="/admin/deposit">Make a deposit</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<div class="row">
<div class="col-md-3 col-xs-12">
		<form:form modelAttribute="filter" action="/admin/deposit" method="get" class="form-inline">
			<div class="form-group">
				<form:input path="search" placeholder="search" class="form-control" />
				<custom:hiddenInputs excludeParams="search"/>
				<button type="submit" class="btn btn-primary">Ok</button>
			</div>
		</form:form>
	</div>




	<div class="col-md-3 col-xs-12"></div>
	<div class="col-md-7 col-xs-12">
		<div class="row">
			<div class="col-md-12 col-xs-12">
			
			
			
			
				<form:form class="form-horizontal" action="/admin/deposit" method="POST" modelAttribute="deposit"  enctype="multipart/form-data">
				
				<form:errors path="*"/>
								<custom:hiddenInputs excludeParams="dateOfDeposit, depositSum, project"/>
				
					<div class="form-group">
						<label for="dateOfDeposit" class="col-sm-offset-2 col-sm-10"><form:errors path="dateOfDeposit"/></label>
					</div>
					<div class="form-group">
    					<label for="deposit" class="col-md-3 control-label">Project name</label>
    					<div class="col-md-9">
      						<form:select class="form-control" path="project" id="deposit" items="${projects}" itemValue="id" itemLabel="name"/>
    					</div>
  					</div>
  					
  					  					
					<div class="form-group">
    					<label for="project" class="col-md-3 control-label">Date Of Deposit</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="dateOfDeposit" id="dateOfDeposit"/>
    					</div>
    					<label for="project" class="col-md-3 control-label">Sum Of Deposit</label>
    					<div class="col-md-9">
      						<form:input type="text" class="form-control" path="depositSum" id="sumOfDeposit"/>
    					</div>
  					</div>
  					
  						<div class="form-group">
  						<div class="col-sm-offset-2 col-sm-3">
		  					
		    				<div class="col-sm-offset-4 col-sm-6">
		    				<button type="submit" class="btn btn-default">Create</button>
	    				</div>
    				</div>  					
  				</div>
  					
  					
  					
  					
  					
				</form:form>
			</div>
		</div>
		<div class="row">
		    <div class="col-md-3 col-xs-3"><h5>Project name</h5></div>
		    <div class="col-md-3 col-xs-3"><h5>Date of Deposit</h5></div>
		    <div class="col-md-2 col-xs-2"><h5>Sum Of Deposit</h5></div>
			<div class="col-md-2 col-xs-2"><h5>Update</h5></div>
			<div class="col-md-2 col-xs-2"><h5>Delete</h5></div>
		</div>
			<c:forEach items="${page.content}" var="deposit">			
				<div class="row">
				    <div class="col-md-3 col-xs-3">${deposit.project.name}</div>
					<div class="col-md-3 col-xs-3">${deposit.dateOfDeposit}</div>
					<div class="col-md-2 col-xs-2">${deposit.depositSum}</div>
					<div class="col-md-2 col-xs-2"><a class="btn btn-warning" href="/admin/deposit/update/${deposit.id}">update</a></div>
					<div class="col-md-2 col-xs-2"><a class="btn btn-danger" href="/admin/deposit/delete/${deposit.id}">delete</a></div>
					
				</div>
				
			</c:forEach>
	</div>
	<div class="col-md-2 col-xs-12">
		<div class="row">
			<div class="col-md-6 col-xs-6 text-center">
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Sort <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<custom:sort innerHtml="Date asc" paramValue="dateOfDeposit"/>
						<custom:sort innerHtml="Date desc" paramValue="dateOfDeposit,desc"/>
					</ul>
				</div>
			</div>
			<div class="col-md-6 col-xs-6 text-center">
				<custom:size posibleSizes="1,2,5,10" size="${page.size}" />
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12 col-xs-12 text-center">
		<custom:pageable page="${page}" cell="<li></li>" container="<ul class='pagination'></ul>" />
	</div>
</div>







