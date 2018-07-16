<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<tag:index>
	<jsp:attribute name="content">
	<div class="card form-card">
	 <div class="card-header form-card-header">
    Edit Blood Request
  </div>
  <div class="card-body">
	<c:url var="request_url" value="/requests/edit/${request.requestId}"></c:url>
	<form:form commandName="request" id="request_form"
					action="${request_url}" method="put" role="form"
					style="display: block;">
					
   <form:hidden path="requestId"/>
   <form:hidden path="user.userId"/>
   <form:hidden path="status.statusId"/>
   <form:hidden path="userAddress.addressId"/>
   
  <div class="form-group">
    <label for="patient_name">Patient Name</label>
    <form:input path="patientName" type="text" class="form-control"
							id="patient_name" placeholder="Patient Name" />
  </div>
  
  <div class="form-group">
    <label for="blood_group">Blood Group</label>
    <form:select path="bloodGroup" class="form-control" id="blood_group">
		<c:forEach var="bloodGroup" items="${bloodGroups}">
				<c:choose>
			<c:when test="${bloodGroup eq request.bloodGroup}">
				<option selected value="${bloodGroup}">${bloodGroup}</option>
			</c:when>
			<c:otherwise>
				<option value="${bloodGroup}">${bloodGroup}</option>
			</c:otherwise>
		</c:choose>
		 		
		</c:forEach>
    </form:select>
  </div>
  
  
  <div class="form-group">
    <label for="urgency_level">Urgency Level</label>
    <form:select path="urgencyLevel.urgencyId" class="form-control"
							id="urgency_level">
    
    <form:options items="${urgencyLevels}" itemLabel="urgency"
								itemValue="urgencyId" />
    </form:select>
  </div>
  
  
  <div class="form-group">
    <label for="address">Address</label>
    <form:input path="userAddress.address" type="text"
							class="form-control" id="address" placeholder="Address" />
  </div>
  
  
    <div class="form-group">
    <label for="state">State</label>
    <form:select path="userAddress.state.stateId" class="form-control"
							id="state">
    
   			<form:options items="${states}" itemLabel="code"
								itemValue="stateId" />
    </form:select>
  </div>
  
  <div class="form-group">
    <label for="city">City</label>
    <form:input path="userAddress.city" type="text" class="form-control"
							id="city" placeholder="City" />
  </div>
  
  
  <div class="form-group">
    <label for="zipcode">Zip Code</label>
    <form:input path="userAddress.zipcode" type="text"
							pattern="[0-9]{5}" class="form-control" id="zipcode"
							placeholder="Zip Code" />
  </div>
  
  
  <div class="form-group">
    <label for="sec_email">Secondary Email</label>
    <form:input path="secondaryEmail" type="email" class="form-control"
							id="sec_email" placeholder="Secondary Email" />
  </div>
  
   <div class="form-group">
    <label for="sec_phone">Secondary Phone</label>
    <form:input path="secondaryPhone" type="tel" class="form-control"
							id="sec_phone" pattern="[0-9]{10}" placeholder="Phone Number" />
  </div>
  
  
  <div class="form-group">
    <label for="remarks">Remarks</label>
    <form:textarea path="remarks" class="form-control" id="remarks"
							rows="3"></form:textarea>
  </div>
  <div class="form-group">
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
  			<button type="submit" class="btn btn-primary">Edit Request</button>
  		</div>
  	</div>
  </div>
</form:form>
</div>
</div>
</jsp:attribute>
</tag:index>