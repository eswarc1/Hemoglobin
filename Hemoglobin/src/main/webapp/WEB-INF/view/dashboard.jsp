<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<tag:index>

	<jsp:attribute name="scripts">
<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"
			type="text/javascript"></script>
 <script>
		var bgData = [ 0, 0, 0, 0, 0, 0, 0, 0 ];
		<c:forEach var="donor" items="${donorList}" >
		<c:if test="${donor.bloodGroup == 'A_POSITIVE'}">
		bgData[0] = bgData[0] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'A_NAGATIVE'}">
		bgData[1] = bgData[1] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'B_POSITIVE'}">
		bgData[2] = bgData[2] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'B_NAGATIVE'}">
		bgData[3] = bgData[3] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'AB_POSITIVE'}">
		bgData[4] = bgData[4] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'AB_NAGATIVE'}">
		bgData[5] = bgData[5] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'O_POSITIVE'}">
		bgData[6] = bgData[6] + 1;
		</c:if>
		<c:if test="${donor.bloodGroup == 'O_NAGATIVE'} ">
		bgData[7] = bgData[7] + 1;
		</c:if>
		</c:forEach>
		renderPieChart(bgData);

		function search() {

			var dataObject = JSON.stringify({
				'state' : $('#state').val(),
				'city' : $('#city').val(),
				'bloodGroup' : $('#blood_group').val(),
				'status' : 'completed'
			});
			$
					.ajax({
						type : "POST",
						contentType : "application/json",
						url : "${base_url}donors/search",
						dataType : 'json',
						timeout : 100000,
						data : dataObject,
						success : function(data) {
							console.log("SUCCESS: ", data);
							$('#donorList').empty();
							var bgData = [ 0, 0, 0, 0, 0, 0, 0, 0 ];
							$
									.each(
											data,
											function(key, donor) {
												if (donor.bloodGroup == 'A_POSITIVE')
													bgData[0] = bgData[0] + 1;
												if (donor.bloodGroup == 'A_NAGATIVE')
													bgData[1] = bgData[1] + 1;
												if (donor.bloodGroup == 'B_POSITIVE')
													bgData[2] = bgData[2] + 1;
												if (donor.bloodGroup == 'B_NAGATIVE')
													bgData[3] = bgData[3] + 1;
												if (donor.bloodGroup == 'AB_POSITIVE')
													bgData[4] = bgData[4] + 1;
												if (donor.bloodGroup == 'AB_NAGATIVE')
													bgData[5] = bgData[5] + 1;
												if (donor.bloodGroup == 'O_POSITIVE')
													bgData[6] = bgData[6] + 1;
												if (donor.bloodGroup == 'O_NAGATIVE')
													bgData[7] = bgData[7] + 1;

												var htmlrow = "<div class='card donor-card'>"
														+ "<div class='card-header' style='color: white; background-color:#ff1a1a '>"
														+ "<div style='float: left'>"
														+ donor.user.firstName
														+ " "
														+ donor.user.lastName
														+ "</div>"
														+ "<div style='float: right'>"
														+ donor.bloodGroup
														+ "</div>"
														+ "</div>"
														+ "<div class='card-body'>";

												htmlrow = htmlrow
														+ "<div class='form-group row'>"
														+ "<div class='col-sm-4'>"
														+ "<label for='name' class='col-form-label form-control-sm'>Mobile</label>"
														+ "<label for='name' class='col-form-label form-control-sm'>"
														+ donor.user.phone
														+ "</label>"
														+ "</div>"
														+ "<div class='col-sm-8'>"
														+ "<label for='name' class='col-form-label form-control-sm'>Email</label>"
														+ "<label for='name' class='col-form-label form-control-sm'>"
														+ donor.user.email
														+ "</label>" + "</div>"
														+ "</div>";

												htmlrow = htmlrow
														+ "<div class='form-group row'>"
														+ "<div class='col-sm-4'>"
														+ "<label for='email' class='col-form-label form-control-sm'>State</label>"
														+ "<label for='name' class='col-form-label form-control-sm'>"
														+ donor.userAddress.state.description
														+ "</label>"
														+ "</div>"
														+ "<div class='col-sm-8'>"
														+ "<label for='name' class='col-form-label form-control-sm'>City</label>"
														+ "<label for='name' class='col-form-label form-control-sm'>"
														+ donor.userAddress.city
														+ "</label>" + "</div>"
														+ "</div>";

												htmlrow = htmlrow
														+ "<div class='form-group row'>"
														+ "<div class='col-sm-4'>"
														+ "<label for='email' class='col-form-label form-control-sm'>Last Donated</label>"
														+ "<label for='name' class='col-form-label form-control-sm'>--</label>"
														+ "</div>"
														+ "<div class='col-sm-8'>"
														+ "<label for='name' class='col-form-label form-control-sm'>Occupation</label>"
														+ "<label for='name' class='col-form-label form-control-sm'>--</label>"
														+ "</div>" + "</div>";
												htmlrow = htmlrow
														+ " </div></div>";
												console.log(htmlrow);
												$('#donorList').append(htmlrow);
											});
							renderPieChart(bgData);
						},
						error : function(e) {
							console.log("ERROR: ", e.Message);
						},
						done : function(e) {
							console.log("DONE");
						}
					});

		}

		function renderPieChart(data) {
			new Chart(document.getElementById("myChart"), {
				"type" : "pie",
				"data" : {
					"labels" : [ "A+", "A-", "B+", "B-", "AB+", "AB-", "O+",
							"O-" ],
					"datasets" : [ {
						"label" : "My First Dataset",
						"data" : data,
						"backgroundColor" : [ "rgb(255, 99, 0)",
								"rgb(54, 162, 235)", "rgb(255, 205, 86)",
								"rgb(63, 99, 11)", "rgb(0, 0, 0)",
								"rgb(1, 32, 132)", "rgb(333, 1, 132)",
								"rgb(255, 99, 796)" ]
					} ]
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
	<c:url var="header_image"
			value='${base_url}static/images/header_bg.jpg' />
	
		

	<fieldset class="col-md-12"
			style="margin-left: 16px; margin-top: 16px; border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse;">    	
		<legend style="width: auto; font-size: 16px; font-family: sans-serif;"> Search </legend>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="form-group row">
				    <div class="col">
				  	  <label for="blood_group" class="col form-control-sm">Blood Group</label>
				  
				      <select class="form-control form-control-sm" id="blood_group"
								name="blood_group">
							<option value="">--select--</option>
							<c:forEach var="bloodGroup" items="${bloodGroups}">
									<option value="${bloodGroup}">${bloodGroup}</option>
							</c:forEach>
				    	</select>
				    </div>
				    
				   <div class="col">
				  	  <label for="state" class="col form-control-sm">State</label>
				  
				      <select class="form-control form-control-sm" id="state"
								name="state">
							<option value="">--select--</option>
							<c:forEach var="state" items="${states}">
									<option value="${state.stateId}">${state.description}</option>
							</c:forEach>
				    	</select>
				    </div>
				    
				    
				   <div class="col">
				  	  <label for="city" class="col form-control-sm">City</label>
				  
				      <input type="text" class="form-control form-control-sm"
								name="city" id="city">
				   </div> 
				   
			       <div class="col">
			        <label for="search" class="col form-control-sm"></label>
   						<button id="search" type="button"
								class="btn btn-primary btn-sm" onclick="javascript:search()">Search</button>
 				   </div>
 				   
 			 	</div>
			</div>
		</div>
	</fieldset>		
	
	<div id="donorList"
			style="margin: 16px; border-color: #CCCCCC; border-width: 1px; border-style: Solid; border-collapse: collapse; float: left; clear: both; width: 650px; height: 500px; overflow: auto;">
	 <c:forEach items="${donorList}" var="donor">
	 <div class="card donor-card">
		 <div class="card-header"
						style="background-color: #ff1a1a; color: white;">
			<div style="float: left">		
	    	<a href="${base_url}donors/${donor.donorId}" style="color: white;text-decoration: none;">${donor.user.firstName} ${donor.user.lastName }</a>
	    	</div>	
	    	<div style="float: right">		
	    	${donor.bloodGroup}
	    	</div>	
	  	 </div>
	 	 <div class="card-body">
	
		  <div class="form-group row">
		  	<div class="col-sm-4">
			    <label for="name" class="col-form-label form-control-sm">Mobile</label>
			    <label for="name" class="col-form-label form-control-sm">${donor.user.phone}</label>
			</div>
			<div class="col-sm-8 ">
			    <label for="name" class="col-form-label form-control-sm">Email</label>
			    <label for="name" class="col-form-label form-control-sm">${donor.user.email}</label>
			</div>
  		 </div>
  
		  <div class="form-group row">
		  	<div class="col-sm-4">
		    	<label for="email" class="col-form-label form-control-sm">State</label>
		    	<label for="name" class="col-form-label form-control-sm">${donor.userAddress.state.description}</label>
		    </div>
		    <div class="col-sm-8">
			    <label for="name" class="col-form-label form-control-sm">City</label>
			    <label for="name" class="col-form-label form-control-sm">${donor.userAddress.city}</label>
			</div>
		  </div>
		  
		  <div class="form-group row">
		  	<div class="col-sm-4">
		    	<label for="email" class="col-form-label form-control-sm">Last Donated</label>
		    	<label for="name" class="col-form-label form-control-sm">${donor.donorInfo.lastDonatedDate}</label>
		    </div>
		    <div class="col-sm-8">
			    <label for="name" class="col-form-label form-control-sm">Occupation</label>
			    <label for="name" class="col-form-label form-control-sm">${donor.donorInfo.occupation}</label>
			</div>
		  </div>
			
	
		 </div>
	 </div>
	 
	
	 </c:forEach>
	 </div>
	 <div style="float: right">
	 <canvas id="myChart" width="300px" height="300px"></canvas>
	 </div>
</jsp:attribute>
</tag:index>