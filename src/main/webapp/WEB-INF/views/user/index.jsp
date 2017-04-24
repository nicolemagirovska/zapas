<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<link href="https://fonts.googleapis.com/css?family=Cormorant|Montserrat|Open+Sans|Open+Sans+Condensed:300|PT+Mono|Raleway" rel="stylesheet">
<!-- <script src="http://bootstrap-ru.com/204/assets/js/bootstrap-carousel.js"></script> -->
<security:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
	<%-- 	<security:authentication property="principal.email"/> --%>
</security:authorize>
<security:authorize access="!isAuthenticated()">
</security:authorize>
<style>
body{
    background-color: #ffffff!important;
    }
.nikka{
margin-top:-20px !important;
}
.col-md-3{
margin-left: 900px !important;
}
.title {
margin-top: 50px;
    text-align: center;
    font-family: 'Open Sans', sans-serif !important;
    line-height: 100px !important;
    
}

.description {
text-align: center;
margin-top:-10px !important;
font-family: 'Open Sans', sans-serif !important;
}

.col-md-6 {
    width: 25% !important;
    margin-top: 10px !important;
    margin-left: -10px !important;
}
.pagination>.active>a{
color: #5e5c5c !important;
    
    background-color: #e6e6e6 !important;
    border-color: #e6e6e6 !important;
}
.pagination>li>a:hover{
color: #5e5c5c !important;
background-color: #e6e6e6 !important;
    border-color: #e6e6e6 !important;
}
.pagination>li>a{
color: #646a6f;
}
.size{
margin-left: 320px !important;
margin-top: -35px !important;
}
form{
margin-left: 58px !important;

}
.project-card.project-card-tall .project-progress-bar .project-percent-pledged, .project-card.project-card-tall-big .project-progress-bar .project-percent-pledged {
    background-color: #2BDE73;
    height: 100%;
}

element.style {
    padding-left: 0px !important;
    padding-right: 0px !important;
}
.container-fluid {
    padding-right: 15px !important;
    padding-left: 15px !important;
   }
 .col-md-12{
    padding-right: 0px !important;
    padding-left: 0px !important;
   }
a:hover {
    color: #333 !important;
    text-decoration: none !important;
}

a{
color:black !important;
}

</style>
<div class="nikka">
	<div class="col-md-12">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
				<a href="/PUSH TURN MOVE">
					<img src="/resources/img/pushturn.jpg" alt="N">
					</a>
				</div>
				<div class="item">
					<img src="/resources/img/togood.jpg" alt="K">
				</div>
				<div class="item">
					<img src="/resources/img/pushturn.jpg" alt="A">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>


<div class="zagolovok">
<h1 class="title">Crowdfunding in Ukraine</h1>
<br>
<h3 class="description">Contribute to the development of crowdfunding and social innovation in Ukraine. Your contribution to the development of a strong and open society where you can raise money for the project. Spot starting capital for social businesses money to develop the invention, the filming and more. Become a co-founder of a good thing - Support means the best projects.</h3>
</div>
<div class="col-md-12">
<div class="col-md-4"></div>
<div class="col-md-4"></div>
<div class="col-md-4">
					<form:form modelAttribute="filter" action="/" method="get" class="form-inline">
					<form:input path="search" placeholder="Search" class="form-control" />
					<custom:hiddenInputs excludeParams="search"/>
					<button type="submit" class="btn btn-primary">Ok</button>
					</form:form>
					<div class="size">
					<custom:size posibleSizes="1,2,5,10" size="${page.size}" />
					</div>
</div>
	
	<div class="container">
	<div class="col-md-12" style="margin-top: 20px;">
	<c:forEach items="${page.content}" var="project">	
				
	  <div class="col-md-4 col-xs-4" style="border: 1px solid #F1EEEA;  margin:5px; padding: 0px; width:358px; background-color: white; height:380px; position:relative;">
	  	<div class="col-md-12 col-xs-12" style="margin: 0px; padding: 0px;"><a href="/${project.name}"><img width="100%" height="230px" src="/resources/img/${project.id}.jpg?version=${project.version}"></a></div>
	  	<div class="col-md-12 col-xs-12" style="margin: 0px; padding: 0px;">Project name: <a href="/${project.name}">${project.name}</a></br>Author: ${project.author}</br>Description: ${project.shortDescription}</div>
	  	      <div class="footer" style="position:absolute; bottom:0;">  
	  	      <div class="col-md-12 col-xs-12" style="margin: 0px; padding: 0px;">Funded: ${project.sumCollected}</div>
	  	              <div class="col-md-12" style="width: 77.81%; height:30%; background-color:#2BDE73;"></div>    
             </div>    
                  
	  </div> 
			</c:forEach>
			</div>
			</div>
	

	</div>
<div class="row">
	<div class="col-md-12 col-xs-12 text-center">
		<custom:pageable page="${page}" cell="<li></li>" container="<ul class='pagination'></ul>" />
	</div>
</div>

<div class="container-fluid">
 
</div>

<script type="text/javascript">
$("#myCarousel").carousel();
</script>