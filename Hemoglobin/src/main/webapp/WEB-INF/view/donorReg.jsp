<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
						
					});
		</script>
	</jsp:attribute>
	<jsp:attribute name="content">
	<div class="card form-card">
	<!--Table-->
	<div class="card-header form-card-header">
     ${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 2 ? 'Request Details' : 'Request Form'}
  </div>
  <div class="card-body">
  	<c:if test="${not empty donorRegSuccessMsg}">
    <div class="alert alert-success alert-dismissible fade show"
						role="alert">
	  ${donorRegSuccessMsg}
	  <button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	
	<c:if test="${not empty donorRegFailureMsg}">
    <div class="alert alert-danger alert-dismissible fade show"
						role="alert">
	  ${donorRegFailureMsg}
	  <button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	<div class="donor-reg-status" style="float: right">
	<c:if test="${not empty donor.status and donor.status.statusId eq 1}">
	 <span><i>Form Status :</i></span>
            <span class="badge badge-primary"><c:out
								value="Pending" /> </span>
            </c:if>
                	<c:if
						test="${not empty donor.status and donor.status.statusId eq 2}">
						           <span><i>Form Status :</i></span>
            <span class="badge badge-warning"><c:out
								value="In Progress" /> </span>
            </c:if>
                	<c:if
						test="${not empty donor.status and donor.status.statusId eq 3}">
						 <span><i>Form Status :</i></span>
            <span class="badge badge-success"><c:out
								value="Accepted" /> </span>
            </c:if>
                	<c:if
						test="${not empty donor.status and donor.status.statusId eq 4}">
						 <span><i>Form Status :</i></span>
            <span class="badge badge-danger"><c:out
								value="Rejected" /> </span>
            </c:if>
    </div>
	
	<c:url var="donor_url" value="donors"></c:url>
	<form:form commandName="donor" id="donor_form" action="${donor_url}"
					method="post" role="form" style="display: block; clear:both ">
				<form:hidden path="donorId" />
				<form:hidden path="user.userId" />
	            <form:hidden path="status.statusId" />
	            <form:hidden path="donorInfo.donorInfoId" />
	            <form:hidden path="userAddress.addressId" />
	            <form:hidden path="donorInfo.workAddress.addressId" />
  <div class="form-group">
    <label for="blood_group">Blood Group</label>
    <form:select path="bloodGroup" class="form-control" id="blood_group">
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
  
    <div class="form-group">
    <label for="dob">Date Of Birth</label>
    <form:input path="dateOfBirth" type="text" class="form-control"
							id="dob" placeholder="Date Of Birth" />
					<!-- Date picker -->
  </div> 
  
  
    <div class="form-group">
	    <label for="gender">Gender</label>
	    <div class="radio">
			  <label><form:radiobutton path="gender" id="gender"
									value="M" />Male</label>
		</div>
		<div class="radio">
		  	  <label><form:radiobutton path="gender" id="gender"
									value="F" />Female</label>
		</div>
 	</div>
 	
  
     <div class="form-group">
	    <label for="occupation">Occupation</label>
	    <form:input path="donorInfo.occupation" type="text"
							class="form-control" id="occupation" placeholder="Occupation" />
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
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
  			<form:button type="submit" class="btn btn-primary">${ donor.donorId eq 0?'Request for membership': 'Edit Request' }</form:button>
  		</div>
  	</div>
  </div>
</form:form>
</div>
</div>

	</jsp:attribute>
</tag:index>