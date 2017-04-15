<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>

.col-sm-3 {
    width: 45px !important;
    margin-left: 250px !important;
}


</style>
<div class="row">
<div class="col-sm-4 col-xs-4"></div>
	<div class="col-sm-4 col-xs-4">
		<form:form class="form-horizontal" action="/login" method="POST">
			<div class="form-group">
    			<label for="login" class="col-sm-2 control-label">Login</label>
    			<div class="col-sm-10">
      				<input class="form-control" name="login" id="login">
       			</div>
  			</div>
			<div class="form-group">
    			<label for="password" class="col-sm-2 control-label">Password</label>
    			<div class="col-sm-10">
      				<input class="form-control" name="password" id="password">
    			</div>
    				</div>
  			  			<div class="form-group">
    			<div class="col-sm-offset-2 col-sm-10">
      				<button type="submit" class="btn btn-primary">Sign in</button>
    			</div>
  			</div>
		</form:form>
	</div>
	<div class="col-sm-4 col-xs-4"></div>