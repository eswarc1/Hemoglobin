<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>

<tag:index>
	<jsp:attribute name="scripts">
	
		<script><!-- Script to toggle between login and registration-->
			$(function() {
				$('#login-form-link').click(function(e) {
					$("#login-form").delay(100).fadeIn(100);
					$("#register-form").fadeOut(100);
					$('#register-form-link').removeClass('active');
					$(this).addClass('active');
					e.preventDefault();
				});
				$('#register-form-link').click(function(e) {
					$("#register-form").delay(100).fadeIn(100);
					$("#login-form").fadeOut(100);
					$('#login-form-link').removeClass('active');
					$(this).addClass('active');
					e.preventDefault();
				});
			});
		</script>
	
	</jsp:attribute>
	
	<jsp:attribute name="content">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="card panel-login">
					<div class="card-header">
						<div class="row">
							<div class="col-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr />
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-12">
							<c:if test="${not empty loginFailureMessage}">
						    <div class="alert alert-danger alert-dismissible fade show" role="alert">
							  ${loginFailureMessage}
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							</div>
							</c:if>
							<c:url var="login_url" value="login"></c:url>
									<form:form commandName="user" id="login-form"
										action="${login_url}" method="post" role="form"
										style="display: block;">
									<div class="form-group">
									<form:input path="email" type="text" name="username"
												tabindex="1" class="form-control" placeholder="Username"
												value="admin@gmail.com" />
									</div>
									<div class="form-group">
									<form:input path="password" type="password" name="password"
												tabindex="2" class="form-control" placeholder="password"
												value="1234" />
									</div>
		
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 offset-sm-3">
												<input type="submit" name="login-submit" id="login-submit"
														tabindex="4" class="form-control btn btn-login"
														value="Log In">
											</div>
										</div>
									</div>
		
								</form:form>
									<c:if test="${not empty registractionFailureMessage}">
								    <div class="alert alert-danger alert-dismissible fade show" role="alert">
									  ${registractionFailureMessage}
									  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
									    <span aria-hidden="true">&times;</span>
									  </button>
									</div>
									</c:if>
								<c:url var="register_url" value="register"></c:url>
								<form:form commandName="user" id="register-form"
										action="${register_url}" method="post" role="form"
										style="display: none;">
									<div class="form-group">
										<form:input path="firstName" type="text" name="firstName"
												id="first_name" tabindex="1" class="form-control"
												placeholder="First Name" value="" />
									</div>
									<div class="form-group">
										<form:input path="lastName" type="text" name="last_name"
												id="last_name" tabindex="2" class="form-control"
												placeholder="Last Name" value="" />
									</div>
											
									<div class="form-group">
										<form:input path="email" type="email" name="email" id="email"
												tabindex="3" class="form-control" placeholder="Email Address"
												value="" />
									</div>
									<div class="form-group">
										<form:input path="password" type="password" name="password"
												id="password" tabindex="4" class="form-control"
												placeholder="Password" />
									</div> 
									
									<div class="form-group">
										<form:input path="phone" type="tel" name="phone" id="phone"
												pattern="[0-9]{10}" tabindex="4" class="form-control"
												placeholder="Phone Number" />
									</div> 
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 offset-sm-3">
												<input type="submit" name="register-submit"
														id="register-submit" tabindex="5"
														class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</jsp:attribute>
</tag:index>


