 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<div class="collapse navbar-collapse" id="one">
                   
                    <security:authorize access="!isAuthenticated()">
	                    <form:form class="navbar-form navbar-right" action="/login" method="POST">
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Login" name="login" style="width:90px;'">
	                        </div>
	                        <div class="form-group">
	                            <input class="form-control" placeholder="Password" type="password" name="password">
	                        </div>
	                        <div class="checkbox">
							    <label>
							      <input name="remember-me" type="checkbox"> Yes, I am an admin
							    </label>
							</div>
	                        <button class="btn btn-primary">Sign in if you are an admin</button>
	                    </form:form>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
	                    <form:form class="navbar-form navbar-right" action="/logout" method="POST">
	                        <button class="btn btn-primary">Sign out</button>
	                    </form:form>
                    	<security:authorize access="hasRole('ROLE_ADMIN')">
		                    <ul class="nav navbar-nav navbar-right">
		                        <li><a href="/admin">Admin</a></li>
		                       
		                    </ul>
                    	</security:authorize>
                    </security:authorize>
                </div>