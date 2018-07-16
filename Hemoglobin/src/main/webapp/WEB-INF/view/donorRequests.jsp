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
	    $('#donorRequests').DataTable({searching: false});
	} );
 
 function search() {
	 
	 var dataObject = JSON.stringify({
		    'name': $('#name').val(),
		    'email': $('#email').val(),
		    'phoneNumber': $('#phone').val(),
		    'bloodGroup': $('#blood_group').val(),
		    'status': $('#status').val()
		});
 	$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${base_url}donors/search",
			dataType : 'json',
			timeout : 100000,
			data: dataObject,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$('#mvcload').empty();
				 $.each(data,function(key, donor) {
			            var htmlrow ="<tr>"
						            +"<td><a href=${base_url}donors/"+donor.donorId+">" + donor.user.firstName +" "+donor.user.lastName+ "</a></td>"
						            +"<td>" + donor.bloodGroup + "</td>"
						            +"<td>";
		        	
					    if (donor.status.statusId== 1)
					    	htmlrow  = htmlrow+"<span class='badge badge-primary'>Pending</span>";
			     
				        if (donor.status.statusId== 2)
				        	htmlrow  = htmlrow+"<span class='badge badge-warning'>In Progress</span>";
				      
						if (donor.status.statusId== 3)
							htmlrow  = htmlrow+"<span class='badge badge-success'>Accepted</span>";
				       
						if (donor.status.statusId== 4)
							htmlrow  = htmlrow+"<span class='badge badge-danger'>Rejected</span>";
		           
						            
						            
					 	htmlrow  = htmlrow+"</td>"
					 	+"<td>" +( donor.user.phone) + "</td>"
					 	+"<td>" + donor.user.email + "</td>"
						+"<td>" +(new Date(donor.createdAt).getFullYear()) + '-' + (new Date(donor.createdAt).getMonth()+ 1) + '-' + new Date(donor.createdAt).getDate() + "</td>";
						           	
					   	htmlrow  = htmlrow+"<td>";
						if (donor.status.statusId != 4)
                        htmlrow  = htmlrow+" <a href=''#' data-toggle='modal' data-target='#deleteModal"+donor.donorId+"'><i class='fa fa-trash' style='color: red' title='delete the request'></i></a></td>";
                     
									
				      
						  	htmlrow  = htmlrow+"</tr>"
						  	
						  	
						  	htmlrow  = htmlrow +"<div class='modal fade' id='deleteModal"+donor.donorId+"'"
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
						  	+"onclick='javascript:deleteDonor("+donor.donorId+")'"
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
 
 
 
 
 
 function deleteDonor(donorId) {
	    	$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "${base_url}donors/delete/"+donorId,
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					$('#mvcload').empty();
					 $.each(data,function(key, donor) {
				            var htmlrow ="<tr>"
							            +"<td><a href=${base_url}donors/"+donor.donorId+">" + donor.user.firstName +" "+donor.user.lastName+ "</a></td>"
							            +"<td>" + donor.bloodGroup + "</td>"
							            +"<td>";
			        	
						    if (donor.status.statusId== 1)
						    	htmlrow  = htmlrow+"<span class='badge badge-primary'>Pending</span>";
				     
					        if (donor.status.statusId== 2)
					        	htmlrow  = htmlrow+"<span class='badge badge-warning'>In Progress</span>";
					      
							if (donor.status.statusId== 3)
								htmlrow  = htmlrow+"<span class='badge badge-success'>Accepted</span>";
					       
							if (donor.status.statusId== 4)
								htmlrow  = htmlrow+"<span class='badge badge-danger'>Rejected</span>";
			           
							            
							            
							 	htmlrow  = htmlrow+"</td>"
							 	+"<td>" +( donor.user.phone) + "</td>"
							 	+"<td>" + donor.user.email + "</td>"
								+"<td>" + (new Date(donor.createdAt).getFullYear()) + '-' + (new Date(donor.createdAt).getMonth()+ 1) + '-' + new Date(donor.createdAt).getDate()  + "</td>";
							           	
						   	htmlrow  = htmlrow+"<td>";
							if (donor.status.statusId != 4)
	                           htmlrow  = htmlrow+" <a href=''#' data-toggle='modal' data-target='#deleteModal"+donor.donorId+"'><i class='fa fa-trash' style='color: red' title='delete the request'></i></a></td>";
					      
							  	htmlrow  = htmlrow+"</tr>"
							  	
							  	
							  	htmlrow  = htmlrow +"<div class='modal fade' id='deleteModal"+donor.donorId+"'"
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
							  	+"onclick='javascript:deleteDonor("+donor.donorId+")'"
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
	<c:url var="base_url" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
<div class="card donor-search-card">
	<!--Table-->
	<div class="card-header form-card-header">
     	Search
  	</div>
  <div class="card-body">
  <form>
  
  <div class="form-group row">
    <label for="status" class="col-sm-4 col-form-label form-control-sm">Status</label>
    <div class="col-sm-6">
      <select class="form-control form-control-sm" id="status"
								name="status">
			<option value="">--select--</option>
			<c:forEach var="status" items="${statusList}">
					
			<c:if test="${status.statusId eq 1}">
				<option value="${status.description}">Pending</option>
            </c:if>
            
            <c:if test="${status.statusId eq 2}">
				<option value="${status.description}">In Progress</option>
            </c:if>
            
            <c:if test="${status.statusId eq 3}">
				<option value="${status.description}">Accepted</option>
            </c:if>
            
            <c:if test="${status.statusId eq 4}">
				<option value="${status.description}">Rejected</option>
            </c:if>
					
			</c:forEach>
    	</select>
   </div>
  </div>
  
  <div class="form-group row">
    <label for="name" class="col-sm-4 col-form-label form-control-sm">Name</label>
    <div class="col-sm-6">
      <input type="text" class="form-control form-control-sm"
								name="name" id="name">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="email" class="col-sm-4 col-form-label form-control-sm">Email</label>
    <div class="col-sm-6">
      <input type="text" class="form-control form-control-sm"
								name="email" id="email">
    </div>
  </div>
  <div class="form-group row">
    <label for="phone" class="col-sm-4 col-form-label form-control-sm">Phone Number</label>
    <div class="col-sm-6">
      <input type="text" class="form-control form-control-sm"
								name="phone" id="phone">
    </div>
  </div>
  <div class="form-group row">
    <label for="blood_group"
							class="col-sm-4 col-form-label form-control-sm">Blood Group</label>
    <div class="col-sm-6">
      <select class="form-control form-control-sm" id="blood_group"
								name="blood_group">
			<option value="">--select--</option>
			<c:forEach var="bloodGroup" items="${bloodGroups}">
					<option value="${bloodGroup}">${bloodGroup}</option>
			</c:forEach>
    	</select>
   </div>
  </div>
  
    
    
   <div class="form-group row">
     <div class="col-sm-6 offset-sm-7 ">
    <button type="button" class="btn btn-primary btn-sm"
								onclick="javascript:search()">Search</button>
    </div>
  </div>
  
</form>
  	
  </div>
  </div>
	
	
<div class="card donor-requests-card">
	<!--Table-->
	<div class="card-header form-card-header">
     	Donor Requests
  	</div>
  <div class="card-body">
<table class="table" id="donorRequests">


    <!--Table head-->
    <thead class="blue-grey lighten-4">
        <tr>
            <th>Donor Name</th>
            <th>Blood Group</th>
            <th>Status</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Requested Date</th>
            <th></th>
        </tr>
    </thead>
    <tbody id="mvcload">
    <c:if test="${empty donorList}">
    	 	<tr>
            <td colspan="7"><i style="text-align: center;">** No Data Found</i></td>
            </tr>
    </c:if>
    <c:forEach items="${donorList}" var="donor">
    <tr>
        <td>
           <a href="${base_url}donors/${donor.donorId}"> <c:out
											value="${donor.user.firstName} ${donor.user.lastName}" /></a>
        </td>
         <td>
            <c:out value="${donor.bloodGroup}" />
        </td>
        <td>
        	<c:if test="${donor.status.statusId eq 1}">
            <span class="badge badge-primary"><c:out
												value="Pending" /> </span>
            </c:if>
                	<c:if test="${donor.status.statusId eq 2}">
            <span class="badge badge-warning"><c:out
												value="In Progress" /> </span>
            </c:if>
                	<c:if test="${donor.status.statusId eq 3}">
            <span class="badge badge-success"><c:out
												value="Accepted" /> </span>
            </c:if>
                	<c:if test="${donor.status.statusId eq 4}">
            <span class="badge badge-danger"><c:out
												value="Rejected" /> </span>
            </c:if>
            
            
        </td>
         <td>
            <c:out value="${donor.user.phone}" />
        </td>
         <td>
            <c:out value="${donor.user.email}" />
        </td>
        <td>
            <c:out value="${donor.createdAt}" />
        </td>
         <td>
         <c:if test="${donor.status.statusId ne 4}">
            <a href="#" data-toggle="modal"
											data-target="#deleteModal${donor.donorId}"><i
											class="fa fa-trash" style="color: red"
											title="delete the request"></i></a>
		 </c:if>
        </td>
    </tr>
    
    <div class="modal fade" id="deleteModal${donor.donorId}"
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
												onclick="javascript:deleteDonor(${donor.donorId})"
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