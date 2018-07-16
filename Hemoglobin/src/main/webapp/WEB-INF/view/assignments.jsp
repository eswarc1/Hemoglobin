<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<tag:index>

	<jsp:attribute name="scripts">
<script>
	$(document).ready(function() {
		$('#assignments').DataTable({
			searching : false
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
<div class="card assignments-card">

	<!--Table-->
	<div class="card-header form-card-header">
     Assignments
  </div>
  <div class="card-body" style="padding: 2px">
<table id="assignments" class="table">
    <!--Table head-->
    <thead class="blue-grey lighten-4">
        <tr>
         <c:if
								test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
            <th>Request ID</th>
            </c:if>
            <th>Patient Name</th>
            <c:if
								test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
            <th>Donor Name</th>
            </c:if>
            <th>Blood Group</th>
            <c:if
								test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
            <th>Status</th>
            </c:if>
            <th>Patient Address</th>
            <th>Patient Phone</th>
            <th>Patient Email</th>
            <th>Request Date</th>
            <c:if
								test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
            <th></th>
            </c:if>
        </tr>
    </thead>
    <tbody id="mvcload">
    <c:if test="${empty assignments}">
    	 	<tr>
            <td colspan="7"><i style="text-align: center;">** No Data Found</i></td>
            </tr>
    </c:if>
    <c:forEach items="${assignments}" var="assignment">
    <tr>
     <c:if
								test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
    	<td>
            <c:out value="${assignment.assignmentId}" />
        </td>
        </c:if>
        <td>
           <a href="${base_url}assignments/${assignment.assignmentId}"> <c:out
											value="${assignment.bloodRequest.patientName}" /></a>
        </td>
        <c:if
									test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
        <td>
            <a href="${base_url}assignments/${assignment.assignmentId}"> 
											${assignment.donor.user.firstName} ${assignment.donor.user.lastName}</a>
        </td>
        </c:if>
        <td>
            <c:out value="${assignment.bloodRequest.bloodGroup}" />
        </td>
        <c:if
									test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
        <td>
        	<c:if test="${assignment.bloodRequest.status.statusId eq 1}">
            <span class="badge badge-primary"><c:out
													value="${assignment.bloodRequest.status.description}" /> </span>
            </c:if>
                	<c:if
											test="${assignment.bloodRequest.status.statusId eq 2}">
            <span class="badge badge-warning"><c:out
													value="${assignment.bloodRequest.status.description}" /> </span>
            </c:if>
                	<c:if
											test="${assignment.bloodRequest.status.statusId eq 3}">
            <span class="badge badge-success"><c:out
													value="${assignment.bloodRequest.status.description}" /> </span>
            </c:if>
                	<c:if
											test="${assignment.bloodRequest.status.statusId eq 4}">
            <span class="badge badge-danger"><c:out
													value="${assignment.bloodRequest.status.description}" /> </span>
            </c:if>
            
            
        </td>
        </c:if>
        <td>
            <c:out
										value="${assignment.bloodRequest.userAddress.address}, 
            ${assignment.bloodRequest.userAddress.city}, ${assignment.bloodRequest.userAddress.state.description} 
            ${assignment.bloodRequest.userAddress.zipcode}" />
        </td>
        <td>${assignment.bloodRequest.user.phone}</td>
        <td>${assignment.bloodRequest.user.email}</td>
        <td>
            <c:out value="${assignment.createdAt}" />
        </td>
        <c:if
									test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
        <td>
        </td>
        </c:if>
    </tr>
    </c:forEach>
    </tbody>


</table>




</div>
</div>
</jsp:attribute>
</tag:index>