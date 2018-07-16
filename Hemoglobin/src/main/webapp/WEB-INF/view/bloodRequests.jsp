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
    $('#bloodRequests').DataTable({searching: false});
} );
	
function loadDonorsToAssign(requestId)
{
	console.log(requestId);
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "${base_url}donors/loadDonors/"+requestId,
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			$('#donorsFor'+requestId).empty();
			var htmlrow="<select name='donors"+requestId+"' class='form-control form-control-sm' id='donors"+requestId+"'>"
			 $.each(data,function(key, donor) {
				 htmlrow=htmlrow+"<option value='"+donor.donorId+"'>"+donor.user.firstName+" "+donor.user.lastName+"<option>"
			 });
			htmlrow=htmlrow+"</select>"
			$('#donorsFor'+requestId).append(htmlrow);
		},
		error : function(e) {
			console.log("ERROR: ", e.Message);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
	
}

function assignDonor(requestId) {
	 var donor=new Object();
	 var bloodRequest=new Object();
	 donor.donorId=$('#donors'+requestId).val();
	 bloodRequest.requestId=$('#requestId'+requestId).val();
	 var dataObject = JSON.stringify({
		    'donor': donor,
		    'bloodRequest': bloodRequest
		});
	 	$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${base_url}assignments",
			dataType : 'json',
			timeout : 100000,
			data: dataObject,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$('#requestStatus'+requestId).empty();
				$('#assignbtn'+requestId).empty();
				$('#requestStatus'+requestId).append("<span class='badge badge-warning'>Donar Assigned</span>")
			},
			error : function(e) {
				console.log("ERROR: ", e.Message);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
}

function deleteRequest(requestId) {
	console.log(requestId);
    	$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${base_url}requests/delete/"+requestId,
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$('#mvcload').empty();
				 $.each(data,function(key, request) {
			            var htmlrow ="<tr>"
						           	+"<td>" + (request.requestId) + "</td>"
						            +"<td><a href=${base_url}requests/"+request.requestId+">" + request.patientName + "</a></td>"
						            +"<td>" + request.bloodGroup + "</td>"
						            +"<td id='requestStatus'"+request.requestId+">";
		        	
					    if (request.status.statusId== 1)
					    	htmlrow  = htmlrow+"<span class='badge badge-primary'>"+request.status.description+ "</span>";
			     
				        if (request.status.statusId== 2)
				        	htmlrow  = htmlrow+"<span class='badge badge-warning'>"+request.status.description+ "</span>";
				      
						if (request.status.statusId== 3)
							htmlrow  = htmlrow+"<span class='badge badge-success'>"+request.status.description+ "</span>";
				       
						if (request.status.statusId== 4)
							htmlrow  = htmlrow+"<span class='badge badge-danger'>"+request.status.description+ "</span>";
		           
						            
						            
					 	htmlrow  = htmlrow+"</td>"
						            +"<td>" + request.userAddress.address+","+request.userAddress.city+","+request.userAddress.state.description+" "+request.userAddress.zipcode + "</td>"
						            +"<td>" + new Date(request.createdAt) + "</td>";
						           	
					   	htmlrow  = htmlrow+"<td>";
						if (request.status.statusId != 4)
                           htmlrow  = htmlrow+" <a href=''#' data-toggle='modal' data-target='#deleteModal"+request.requestId+"'><i class='fa fa-trash' style='color: red' title='delete the request'></i></a></td>";
                        
                        htmlrow  = htmlrow+"<td id='assignbtn'"+request.requestId+">";
						if(request.user.userrole.roleId == 3 && request.status.statusId==1 )
						  	htmlrow  = htmlrow+" <a href='#'><i class='fa fa-plus' style='color: plus' title='Assign Donar'></i></a></td>";										
				      
						  	htmlrow  = htmlrow+"</tr>"
						  	
						  	
						  	htmlrow  = htmlrow +"<div class='modal fade' id='deleteModal"+request.requestId+"'"
						  	+"tabindex=''-1' role='dialog'"
						  	+"aria-labelledby='exampleModalLongTitle' aria-hidden='true'>"
						  	+"<div class='modal-dialog' role='document'>"
						  	+"<div class='modal-content'>"
						  	+"<div class='modal-header'>"
						  	+"<h5 class='modal-title' id='exampleModalLongTitle'>Delete Request</h5>"
						  	+"<button type='button' class='close' data-dismiss='modal'"
						  	+"aria-label='Close'>"
						  	+"<span aria-hidden='true'>&times;</span>"
						  	+"</button>"
						  	+"</div>"
						  	+"<div class='modal-body'>"
						  	+"<p>Do you want to delete the request ?</p>"
						  	+"</div>"
						  	+"<div class='modal-footer'>"
						  	+"<button type='button' class='btn btn-secondary'"
						  	+"data-dismiss='modal'>Close</button>"
						  	+"<button type='button'"
						  	+"onclick='javascript:deleteRequest("+request.requestId+")'"
						  	+"data-dismiss='modal' class='btn btn-danger'>Delete</button>";
						  	
						  	
					  console.log(htmlrow);
				      $('#mvcload').append(htmlrow); 
		        }); 
			},
			error : function(e) {
				console.log("ERROR: ", e.Message);
			},
			done : function(e) {
				console.log("DONE");
			}
		});

}
</script>
</jsp:attribute>

	<jsp:attribute name="content">
	<c:set var="req" value="${pageContext.request}" />
	<c:set var="url">${req.requestURL}</c:set>
	<c:set var="uri" value="${req.requestURI}" />
	<c:url var="base_url"
			value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
<div class="card form-card">

	<!--Table-->
	<div class="card-header form-card-header">
     ${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3 ? '' : 'Your '}Blood Requests
  </div>
  <div class="card-body">
<table id="bloodRequests" class="table">
    <!--Table head-->
    <thead class="blue-grey lighten-4">
        <tr>
            <th>Request ID</th>
            <th>Patient Name</th>
            <th>Blood Group</th>
            <th>Status</th>
            <th>Address</th>
            <th>Request Date</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="mvcload">
    <c:if test="${empty requests}">
    	 	<tr>
            <td colspan="7"><i style="text-align: center;">** No Data Found</i></td>
            </tr>
    </c:if>
    <c:forEach items="${requests}" var="request">
    <tr>
    	<td>
            <c:out value="${request.requestId}" />
        </td>
        <td>
           <a href="${base_url}requests/${request.requestId}"> <c:out
											value="${request.patientName}" /></a>
        </td>
        <td>
            <c:out value="${request.bloodGroup}" />
        </td>
        <td id="requestStatus${request.requestId}">
        	<c:if test="${request.status.statusId eq 1}">
            <span class="badge badge-primary"><c:out
												value="${request.status.description}" /> </span>
            </c:if>
                	<c:if test="${request.status.statusId eq 2}">
            <span class="badge badge-warning"><c:out
												value="${request.status.description}" /> </span>
            </c:if>
                	<c:if test="${request.status.statusId eq 3}">
            <span class="badge badge-success"><c:out
												value="${request.status.description}" /> </span>
            </c:if>
                	<c:if test="${request.status.statusId eq 4}">
            <span class="badge badge-danger"><c:out
												value="${request.status.description}" /> </span>
            </c:if>
            
            
        </td>
        <td>
            <c:out
										value="${request.userAddress.address}, 
            ${request.userAddress.city}, ${request.userAddress.state.description} 
            ${request.userAddress.zipcode}" />
        </td>
        <td>
            <c:out value="${request.createdAt}" />
        </td>
         <td>
          <c:if test="${request.status.statusId ne 4}">
            <a href="#" data-toggle="modal"
											data-target="#deleteModal${request.requestId}"><i
											class="fa fa-trash" style="color: red"
											title="delete the request"></i></a>
		  </c:if>
        </td>
        <td id="assignbtn${request.requestId}">
        <c:if
										test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3 and request.status.statusId eq 1 }">
        <a href="#" data-toggle="modal"
											onclick="loadDonorsToAssign(${request.requestId})"
											data-target="#assignModal${request.requestId}"><i
											class="fa fa-user-plus" style="color: blue"
											title="Assign Donar"></i></a>
        </c:if>
        </td>
    </tr>
    
    
  <div class="modal fade" id="assignModal${request.requestId}"
								tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Assign Donor</h5>
        <button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
		<input type="hidden" id="requestId${request.requestId}" name="requestId${request.requestId}" value="${request.requestId}"/> 
      <div class="modal-body">
      <div class="form-group row">
	    <label for="donors${request.requestId}" class="col-sm-4 col-form-label form-control-sm">Donors</label>
	    <div class="col-sm-6" id="donorsFor${request.requestId}">
	    
	    </div>
	  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
        <button type="button" onclick="javascript:assignDonor(${request.requestId})" data-dismiss="modal" class="btn btn-danger">Assign</button>
      </div>
    </div>
  </div>
</div>   
    
            
 <div class="modal fade" id="deleteModal${request.requestId}"
								tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Delete Request</h5>
        <button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Do you want to delete the request ?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
        <button type="button"
												onclick="javascript:deleteRequest(${request.requestId})"
												data-dismiss="modal" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>
    </c:forEach>
    </tbody>


</table>




</div>
</div>
</jsp:attribute>
</tag:index>