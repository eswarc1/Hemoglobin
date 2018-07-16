<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<tag:index>
	<jsp:attribute name="content">
	
	<div class="home-error-msg-section">
	<c:if test="${not empty homeErrorMessage}">
    <div class="alert alert-danger alert-dismissible fade show"
					role="alert">
	  ${homeErrorMessage}
	  <button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	</div>
	
  
  
  <div class="card request-card" style="clear: both;">
	 <div class="card-header form-card-header">
      REQUEST FOR BLOOD
     </div>
     <div class="card-body">
		<c:url var="request_url" value="requests"></c:url>
		
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
		<form:form commandName="request" id="request_form"
						action="${request_url}" method="post" role="form"
						style="display: block;">
	  
	  <div class="form-group row">
	    <label for="patient_name" class="col-sm-4 col-form-label form-control-sm">Patient Name</label>
	    <div class="col-sm-6">
	    <form:input path="patientName" type="text" class="form-control form-control-sm"
								id="patient_name" placeholder="Patient Name" />
		</div>
	  </div>
	  
	  <div class="form-group row">
	    <label for="blood_group" class="col-sm-4 col-form-label form-control-sm">Blood Group</label>
	    <div class="col-sm-6">
	    <form:select path="bloodGroup" class="form-control form-control-sm" id="blood_group">
			<c:forEach var="bloodGroup" items="${bloodGroups}">
			 		<option value="${bloodGroup}">${bloodGroup}</option>
			</c:forEach>
	    </form:select>
	    </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="urgency_level" class="col-sm-4 col-form-label form-control-sm">Urgency Level</label>
	    <div class="col-sm-6">
	    <form:select path="urgencyLevel.urgencyId" class="form-control form-control-sm"
								id="urgency_level">
	    
	    <form:options items="${urgencyLevels}" itemLabel="urgency"
									itemValue="urgencyId" />
	    </form:select>
	    </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="address" class="col-sm-4 col-form-label form-control-sm">Address</label>
	    <div class="col-sm-6">
	    <form:input path="userAddress.address" type="text"
								class="form-control form-control-sm" id="address" placeholder="Address" />
								 </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="state" class="col-sm-4 col-form-label form-control-sm">State</label>
	    <div class="col-sm-6">
	    <form:select path="userAddress.state.stateId" class="form-control form-control-sm"
								id="state">
	   			<form:options items="${states}" itemLabel="code"
									itemValue="stateId" />
	    </form:select>
	    </div>
	  </div>
	  
	  <div class="form-group row">
	    <label for="city" class="col-sm-4 col-form-label form-control-sm">City</label>
	    <div class="col-sm-6">
	    <form:input path="userAddress.city" type="text" class="form-control form-control-sm"
								id="city" placeholder="City" />
								 </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="zipcode" class="col-sm-4 col-form-label form-control-sm">Zip Code</label>
	    <div class="col-sm-6">
	    <form:input path="userAddress.zipcode" type="text"
								pattern="[0-9]{5}" class="form-control form-control-sm" id="zipcode"
								placeholder="Zip Code" />
								 </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="sec_email" class="col-sm-4 col-form-label form-control-sm">Secondary Email</label>
	    <div class="col-sm-6">
	    <form:input path="secondaryEmail" type="email" class="form-control form-control-sm"
								id="sec_email" placeholder="Secondary Email" />
								 </div>
	  </div>
	  
	   <div class="form-group row">
	    <label for="sec_phone" class="col-sm-4 col-form-label form-control-sm">Secondary Phone</label>
	    <div class="col-sm-6">
	    <form:input path="secondaryPhone" type="tel" class="form-control form-control-sm"
								id="sec_phone" pattern="[0-9]{10}" placeholder="Phone Number" />
								 </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="remarks" class="col-sm-4 col-form-label form-control-sm">Remarks</label>
	    <div class="col-sm-6">
	    <form:textarea path="remarks" class="form-control form-control-sm" id="remarks"
								rows="3"></form:textarea>
								 </div>
	  </div>
		
		<div style="clear:both;text-align: center;">
	  			<button type="submit" class="btn btn-primary form-control-sm">Request</button>
	  	</div>
	</form:form>
	</div>
</div>
</jsp:attribute>
</tag:index>