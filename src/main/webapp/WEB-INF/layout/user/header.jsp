<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
  <style>
        <%--   
             
             .navbar-brand {
    		margin-left: 550px !important;
    		
}
.form-inline .form-group{
padding-left:10px !important;
padding-top: 10px !important;
}--%>
            .navbar-default {
    background-color: #ffffff;
    border-color: #ffffff;
}
.navbar-fixed-top {
    top: 0;
    border-width: 0 0 0px !important;
}
 .navbar-brand{
                padding: 0 9px;
                padding-left: 580px !important;
                height: 55px;
              
                            }
             .img-thumbnail{
             border: 0px !important;
             border-radius: 0px !important;
             
             }
         
                 .btn-primary {
    color: #888 !important;
    background-color: #e0e0e0 !important;
    border-color: #e0e0e0 !important;
    margin-left: 0px !important;
    
}
.btn-primary:hover {
color: #333 !important;
    background-color: #e6e6e6 !important;
    border-color: #adadad !important;
}
.btn{
border-radius: 0px !important;
}

.form-control{
border-radius: 0px !important;
    height: 33px !important;
    border-color: #e0e0e0 !important;
}
form {
margin-top:8px !important;
}
  </style>
  <div class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#responsive-menu" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                               
                <a href="/" class="navbar-brand">
                        <img src="/resources/img/5.png" class="img img-thumbnail" width="103px">
                    </a>
                      </div>
                      <div class="collapse navbar-collapse" id="responsive-menu">
                 <ul class="nav navbar-nav navbar-right">
                 	  <li><a href="/admin">Creator Page</a></li>
				 </ul>
				</div>
				
         	
         	 </div>       
           
        </div>