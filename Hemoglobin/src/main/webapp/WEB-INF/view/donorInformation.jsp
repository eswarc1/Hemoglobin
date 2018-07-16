<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<tag:index>
	<jsp:attribute name="scripts">
		<script>
			$(document).ready(
					function() {
						$('#dob').datepicker({
							format : 'mm/dd/yyyy',
							todayHighlight : true,
							autoclose : true,
						});
						
						$('#ldd').datepicker({
							format : 'mm/dd/yyyy',
							todayHighlight : true,
							autoclose : true,
						});
						
						$('#id_issue_date').datepicker({
							format : 'mm/dd/yyyy',
							todayHighlight : true,
							autoclose : true,
						});
						
						$('#id_expiry_date').datepicker({
							format : 'mm/dd/yyyy',
							todayHighlight : true,
							autoclose : true,
						});
					});
		</script>
	</jsp:attribute>
	<jsp:attribute name="content">
		<c:set var="req" value="${pageContext.request}" />
		<c:set var="url">${req.requestURL}</c:set>
		<c:set var="uri" value="${req.requestURI}" />
		<c:url var="base_url"
			value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
		<c:url var="header_image"
			value='${base_url}/static/images/header_bg.jpg' />
		<c:if test="${not empty successMessage}">
		    <div class="alert alert-success alert-dismissible fade show"
				role="alert">
			  ${successMessage}
			  <button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		</c:if>
		
		<c:if test="${not empty failureMessage}">
		    <div class="alert alert-danger alert-dismissible fade show"
				role="alert">
			  ${failureMessage}
			  <button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		</c:if>

 		 <form:form commandName="donor" id="request_form"
			action="${base_url}donors/${donor.donorId}" method="post" role="form"
			style="display: block;">
				<form:hidden path="donorId" />
				<form:hidden path="user.userId" />
	            <form:hidden path="status.statusId" />
	            <form:hidden path="donorInfo.donorInfoId" />
	            <form:hidden path="userAddress.addressId" />
	            <form:hidden path="donorInfo.workAddress.addressId" />
	             <form:hidden path="bloodTests.bloodTestId" />
	        <div class="row">
                
				<!-- Personal information -->
				<div class="col-md-5"> 
					<div class="card donor-info-card" style="clear: both;">
						 <div class="card-header form-card-header">
					      Personal Info
					     </div>
					     <div class="card-body">
							<div class="form-group row">
							    <label for="first_name"
									class="col-sm-4 col-form-label form-control-sm">First Name</label>
							    <div class="col-sm-6">
							       <form:input path="user.firstName" type="text"
										class="form-control form-control-sm" name="first_name"
										id="first_name" />
							    </div>
			  				</div>
			  				
			  				<div class="form-group row">
							    <label for="last_name"
									class="col-sm-4 col-form-label form-control-sm">Last Name</label>
							    <div class="col-sm-6">
							       <form:input path="user.lastName" type="text"
										class="form-control form-control-sm" name="last_name"
										id="last_name" />
							    </div>
			  				</div>
			  				
			  				<div class="form-group row">
							    <label for="email"
									class="col-sm-4 col-form-label form-control-sm">Email</label>
							    <div class="col-sm-6">
							       <form:input path="user.email" type="text"
										class="form-control form-control-sm" name="email" id="email" />
							    </div>
			  				
			  				</div>
			  				
			  				<div class="form-group row">
							    <label for="phone"
									class="col-sm-4 col-form-label form-control-sm">Phone</label>
							    <div class="col-sm-6">
							       <form:input path="user.phone" type="text"
										class="form-control form-control-sm" name="phone" id="phone" />
							    </div>
			  				
			  				</div>
			  				
						
			  				<div class="form-group row">
							    <label for="dob"
									class="col-sm-4 col-form-label form-control-sm">Date Of Birth</label>
							    <div class="col-sm-6">
			 					   <form:input path="dateOfBirth" type="text"
										class="form-control" id="dob" placeholder="Date Of Birth" />
								</div>
								<!-- Date picker -->
			  				</div> 
			  				
			  				 <div class="form-group row">
							     <label for="gender"
									class="col-sm-4 col-form-label form-control-sm">Gender</label>
							     <div class="col-sm-6">
								    <div class="radio">
										  <label><form:radiobutton path="gender" id="gender"
												value="M" />Male</label>
									</div>
									<div class="radio">
									  	  <label><form:radiobutton path="gender" id="gender"
												value="F" />Female</label>
									</div>
								</div>
							 	</div>
				  
				  				<div class="form-group row">
								    <label for="address"
									class="col-sm-4 col-form-label form-control-sm">Address</label>
								    <div class="col-sm-6">
					    				<form:input path="userAddress.address" type="text"
										class="form-control" id="address" placeholder="Address" />
				  					</div>
								</div>
								
								
								<div class="form-group row">
								    <label for="state"
									class="col-sm-4 col-form-label form-control-sm">State</label>
								    <div class="col-sm-6">
									    <form:select path="userAddress.state.stateId"
										class="form-control" id="state">
									   			<form:options items="${states}" itemLabel="code"
											itemValue="stateId" />
									    </form:select>
				  					</div>
				  				</div>
				  
								
								<div class="form-group row">
								    <label for="city"
									class="col-sm-4 col-form-label form-control-sm">City</label>
								    <div class="col-sm-6">
							    		<form:input path="userAddress.city" type="text"
										class="form-control" id="city" placeholder="City" />
							  		</div>
				           		</div>
							
								<div class="form-group row">
								    <label for="zipcode"
									class="col-sm-4 col-form-label form-control-sm">Zip Code</label>
								    <div class="col-sm-6">
				   						 <form:input path="userAddress.zipcode" type="text"
										pattern="[0-9]{5}" class="form-control" id="zipcode"
										placeholder="Zip Code" />
				 					 </div>
				 				</div>
			
					       </div>
					</div>
				</div>
				<!-- Characteristics information -->
				<div class="col-md-5">     
					<div class="card donor-info-card" style="clear: both;">
						 <div class="card-header form-card-header">
					      Characteristics
					     </div>
					     <div class="card-body">
						 	<div class="form-group row">
							    <label for="blood_group"
									class="col-sm-4 col-form-label form-control-sm">Blood Group</label>
							    <div class="col-sm-6">
							       <form:select path="bloodGroup"
										class="form-control form-control-sm" id="blood_group"
										name="blood_group">
										<option value="">--select--</option>
										<c:forEach var="bloodGroup" items="${bloodGroups}">
										 <c:choose>
											<c:when test="${bloodGroup eq donor.bloodGroup}">
												<option selected value="${bloodGroup}">${bloodGroup}</option>
											</c:when>
											<c:otherwise>
												<option value="${bloodGroup}">${bloodGroup}</option>
											</c:otherwise>
										</c:choose>
										</c:forEach>
							    	</form:select>
							    </div>
			  				</div>
			  				
					  		<div class="form-group row">
							    <label for="ldd"
									class="col-sm-4 col-form-label form-control-sm">Last Donated Date</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.lastDonatedDate" type="text"
										class="form-control" id="ldd" placeholder="Last Donated Date" />
									<!-- Date picker -->
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="hair_color"
									class="col-sm-4 col-form-label form-control-sm">Hair Color</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.hairColor" type="text"
										class="form-control" id="hair_color" placeholder="Hair Color" />
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="eye_color"
									class="col-sm-4 col-form-label form-control-sm">Eye Color</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.eyeColor" type="text"
										class="form-control" id="eye_color" placeholder="Eye Color" />
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="height"
									class="col-sm-4 col-form-label form-control-sm">Height</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.height" type="text"
										class="form-control" id="height" placeholder="Height" />
			  					</div>
							</div>
							
							
							<div class="form-group row">
							    <label for="weight"
									class="col-sm-4 col-form-label form-control-sm">Weight</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.weight" type="text"
										class="form-control" id="weight" placeholder="Weight" />
			  					</div>
							</div>
		
					     </div>
				    </div>
			    </div>
			    <!-- Identification information -->
			    <div class="col-md-5">  
				    <div class="card donor-info-card" style="clear: both;">
						 <div class="card-header form-card-header">
					      Identifications
					     </div>
					     <div class="card-body">
							
							<div class="form-group row">
							    <label for="ssn"
									class="col-sm-4 col-form-label form-control-sm">SSN</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.ssn" type="text"
										class="form-control" id="ssn" placeholder="SSN" />
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="id_type"
									class="col-sm-4 col-form-label form-control-sm">ID Type</label>
							    <div class="col-sm-6">
							       <form:select path="donorInfo.idType"
										class="form-control form-control-sm" id="id_type"
										name="id_type">
										<option value="">--select--</option>
										<option value="Driverse License">Driverse License</option>
										<option value="Passport">Passport</option>
							    	</form:select>
							    </div>
			  				</div>
			  				
			  				
			  				<div class="form-group row">
							    <label for="id_number"
									class="col-sm-4 col-form-label form-control-sm">ID Number</label>
							    <div class="col-sm-6">
							       <form:input path="donorInfo.idNumber" type="text"
										class="form-control" id="id_number" placeholder="ID Number" />
							    </div>
			  				</div>
			  				
			  				<div class="form-group row">
							    <label for="id_issue_date"
									class="col-sm-4 col-form-label form-control-sm">ID Issue Date</label>
							    <div class="col-sm-6">
							       <form:input path="donorInfo.idIssueDate" type="text"
										class="form-control" id="id_issue_date"
										placeholder="ID issue Date" />
									<!-- Date picker -->
							    </div>
			  				</div>
			  				
			  				<div class="form-group row">
							    <label for="id_expiry_date"
									class="col-sm-4 col-form-label form-control-sm">ID Expire Date</label>
							    <div class="col-sm-6">
							       <form:input path="donorInfo.idExpiryDate" type="text"
										class="form-control" id="id_expiry_date"
										placeholder="ID Expire Date" />
									<!-- Date picker -->
							    </div>
			  				</div>
				  				
					     </div>
				     </div>
				</div>
				<!-- Work information -->
				<div class="col-md-5"> 
					<div class="card donor-info-card" style="clear: both;">
						 <div class="card-header form-card-header">
					      Work Information
					     </div>
					     <div class="card-body">
							
							<div class="form-group row">
							    <label for="occupation"
									class="col-sm-4 col-form-label form-control-sm">Occupation</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.occupation" type="text"
										class="form-control" id="occupation" placeholder="Occupation" />
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="work_address"
									class="col-sm-4 col-form-label form-control-sm">Work Address</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.workAddress.address" type="text"
										class="form-control" id="work_address"
										placeholder="Work Address" />
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="work_address_city"
									class="col-sm-4 col-form-label form-control-sm">City</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.workAddress.city" type="text"
										class="form-control" id="work_address_city" placeholder="City" />
			  					</div>
							</div>
							
							
							<div class="form-group row">
							    <label for="work_address_state"
									class="col-sm-4 col-form-label form-control-sm">State</label>
							    <div class="col-sm-6">
									    <form:select path="donorInfo.workAddress.state.stateId"
										class="form-control" id="work_address_state">
									   			<form:options items="${states}" itemLabel="code"
											itemValue="stateId" />
									    </form:select>
			  					</div>
							</div>
							
							<div class="form-group row">
							    <label for="work_address_zip_code"
									class="col-sm-4 col-form-label form-control-sm">Zip Code</label>
							    <div class="col-sm-6">
				    				<form:input path="donorInfo.workAddress.zipcode" type="text"
										class="form-control" id="work_address_zip_code"
										placeholder="Zip Code" />
			  					</div>
							</div>
							
					     </div>
				    </div>    
				</div>
				<!-- Tests information -->
				<div class="col-md-5"> 
					<div class="card donor-info-card" style="clear: both;">
						 <div class="card-header form-card-header">
					      Tests Information
					     </div>
					     <div class="card-body">
							 
							 <div class="form-group row">
							     <label for="hiv"
									class="col-sm-4 col-form-label form-control-sm">HIV</label>
							     <div class="col-sm-6">
								    <div class="radio">
										  <label><form:radiobutton path="bloodTests.hiv"
												id="hiv" value="P" />PASS</label>
									</div>
									<div class="radio">
									  	  <label><form:radiobutton path="bloodTests.hiv"
												id="hiv" value="F" />FAIL</label>
									</div>
								</div>
						    </div>
						    
						    <div class="form-group row">
							     <label for="hepatitis"
									class="col-sm-4 col-form-label form-control-sm">Hepatitis B/C</label>
							     <div class="col-sm-6">
								    <div class="radio">
										  <label><form:radiobutton path="bloodTests.hepatitis"
												id="hepatitis" value="P" />PASS</label>
									</div>
									<div class="radio">
									  	  <label><form:radiobutton
												path="bloodTests.hepatitis" id="hepatitis" value="F" />FAIL</label>
									</div>
								</div>
						    </div>
						    
						    <div class="form-group row">
							     <label for="syphilis"
									class="col-sm-4 col-form-label form-control-sm">Syphilis</label>
							     <div class="col-sm-6">
								    <div class="radio">
										  <label><form:radiobutton path="bloodTests.syphilis"
												id="syphilis" value="P" />PASS</label>
									</div>
									<div class="radio">
									  	  <label><form:radiobutton
												path="bloodTests.syphilis" id="syphilis" value="F" />FAIL</label>
									</div>
								</div>
						    </div>
						    
						    <div class="form-group row">
							     <label for="malaria"
									class="col-sm-4 col-form-label form-control-sm">Malaria</label>
							     <div class="col-sm-6">
								    <div class="radio">
										  <label><form:radiobutton path="bloodTests.malaria"
												id="malaria" value="P" />PASS</label>
									</div>
									<div class="radio">
									  	  <label><form:radiobutton path="bloodTests.malaria"
												id="malaria" value="F" />FAIL</label>
									</div>
								</div>
						    </div>
						    
						    <div class="form-group row">
							     <label for="drug_test"
									class="col-sm-4 col-form-label form-control-sm">Drug Test</label>
							     <div class="col-sm-6">
								    <div class="radio">
										  <label><form:radiobutton path="bloodTests.drugTest"
												id="drug_test" value="P" />PASS</label>
									</div>
									<div class="radio">
									  	  <label><form:radiobutton
												path="bloodTests.drugTest" id="drug_test" value="F" />FAIL</label>
									</div>
								</div>
						    </div>
							
					     </div>
				    </div>  
				</div>     
			</div>
		    <div class="bottom_btns" style="clear: both; text-align: center;">
		     	<form:button type="submit" class="btn btn-primary">Update Info</form:button>
		     	<c:if
					test="${not empty donor.status and (donor.status.statusId eq 1 or donor.status.statusId eq 2)}">
		     	<a href="${base_url}donors/approve/${donor.donorId}"
						class="btn btn-primary">Approve</a>
					</c:if>
		     	<a href="${base_url}donors/requests" class="btn btn-primary">Close</a>
		     </div>
	     
	     </form:form>
	</jsp:attribute>
</tag:index>