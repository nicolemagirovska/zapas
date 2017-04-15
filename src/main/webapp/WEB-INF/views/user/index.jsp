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
    background-color: #f2f2f2 !important;
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
					<img src="/resources/img/like.png" alt="N">
				</div>
				<div class="item">
					<img src="/resources/img/like.png" alt="K">
				</div>
				<div class="item">
					<img src="/resources/img/like.png" alt="A">
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
<h1 class="title">Краудфандинг в Україні</h1>
<br>
<h3 class="description">Твій вклад в розвиток сильного і відкритого суспільства, де ти можеш зібрати гроші на проект. Знайди стартовий капітал для соціального бізнесу, гроші на розробку винаходу, зйомку фільму та інше. Стань співзасновником добрих справ – підтримай коштами кращі проекти.</h3>
</div>

<form method="POST" accept-charset="utf-8" action="https://www.liqpay.com/api/3/checkout">
<input type="hidden" name="data" value="eyJ2ZXJzaW9uIjozLCJhY3Rpb24iOiJwYXlkb25hdGUiLCJwdWJsaWNfa2V5IjoiaTg1NDMzMDU4ODY2IiwiYW1vdW50IjoiMSIsImN1cnJlbmN5IjoiVVNEIiwiZGVzY3JpcHRpb24iOiJQcm9qZWN0MSIsInR5cGUiOiJkb25hdGUiLCJsYW5ndWFnZSI6ImVuIn0=" />
<input type="hidden" name="signature" value="rfc1cyQH2q/2C3vjGYy5P4lJ1Wk=" />
<input type="image" src="//static.liqpay.com/buttons/d1en.png" name="btn_text" />
</form>


<div class="row">
<div class="col-md-3">
		<div class="row">
		
		<form:form modelAttribute="filter" action="/" method="get" class="form-inline">
			        <div class="form-group">
					<form:input path="search" placeholder="Search" class="form-control" />
					<custom:hiddenInputs excludeParams="search"/>
					<button type="submit" class="btn btn-primary">Ok</button>
					</div>
					</form:form>
 		</div>
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
					
				</div>
			</c:forEach>
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