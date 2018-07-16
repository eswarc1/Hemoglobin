<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="content" fragment="true"%>
<%@ attribute name="scripts" fragment="true"%>
<%@ attribute name="styles" fragment="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Hemoglobin</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
<link
	href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<link href="<c:url value="/static/css/styles.css"/>" rel="stylesheet">

<jsp:invoke fragment="styles" />
</head>

<body>
	<c:set var="req" value="${pageContext.request}" />
	<c:set var="url">${req.requestURL}</c:set>
	<c:set var="uri" value="${req.requestURI}" />
	<c:url var="base_url"
		value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
	<!-- Top Menu -->
	<section class="top-menu">
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
			<div>
			<span><i>Welcome, <c:out
						value="${sessionScope.user.firstName}" /></i></span>
				<span><a class="dropdown-item" href="${base_url}logout">logout</a></span></div>
			</c:when>
			<c:otherwise>
				<a class="dropdown-item" href="${base_url}login">log in</a>
			</c:otherwise>
		</c:choose>

		<!-- <div class="dropdown">
			<button type="button"
				class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
				id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				Action <span class="sr-only">Toggle Dropdown</span>
			</button>

			<div class="dropdown-menu" aria-labelledby="dropdownMenu">
				<a class="dropdown-item" href="#">Link 1</a> <a
					class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
					href="logout">Logout</a>
			</div>
		</div> -->
	</section>

	<!-- Header -->
	<c:url var="header_image" value='/static/images/header_bg.jpg' />

	<c:choose>
		<c:when
			test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
				<c:url var="image_nav_url"
					value="${base_url}donors/dashboard" />
		</c:when>
		<c:otherwise>
			<c:url var="image_nav_url"
					value="${base_url}" />
		</c:otherwise>
	</c:choose>
</head>
<header class="header-menu">
	<div class="header-img"
		style="background-image: url('${header_image}');">
		<a href="${image_nav_url}"> <img
			src="${base_url}static/images/primary_logo.png" height="70px"
			width="200px" />
		</a>
	</div>
	<nav class="header-nav navbar">
		<ul class="nav">

			<c:if test="${empty sessionScope.user}">
				<li class="nav-item"><a class="nav-link"
					href="${base_url}">Home</a></li>
			</c:if>

			<c:if
				test="${not empty sessionScope.user and sessionScope.user.userrole.roleId ne 3}">
				<li class="nav-item"><a class="nav-link"
					href="${base_url}">Home</a></li>
			</c:if>
			<c:if
				test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 1}">
				<li class="nav-item"><a class="nav-link"
					href="${base_url}donors">Become A Donor</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${base_url}requests">Your
						Requests</a></li>
			</c:if>
			<c:if
				test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 2}">
				<li class="nav-item"><a class="nav-link"
					href="${base_url}donors">Donor Profile
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${base_url}requests">Your
						Requests</a></li>
				<li class="nav-item"><a class="nav-link" href="${base_url}assignments">Your Assignments</a></li>
			</c:if>
			<c:if
				test="${not empty sessionScope.user and sessionScope.user.userrole.roleId eq 3}">
				<li class="nav-item"><a class="nav-link"
					href="${base_url}donors/dashboard">
						Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${base_url}requests/all">Blood
						Requests</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${base_url}donors/requests">Donor
						Request list</a></li>
				<li class="nav-item"><a class="nav-link" href="${base_url}assignments">Assignments</a></li>
			</c:if>

		</ul>
	</nav>
</header>

<!-- Page Content -->
<div class="container">
	<jsp:invoke fragment="content" />
</div>


<!-- Footer -->
<c:url var="footer_image" value='/static/images/footer_bg.png' />
<footer class="footer" style="background-image: url('${footer_image}');">
	<div class="row">
		<div class="col-lg-12">
			<p>Copyright &copy; Your Website 2018</p>
		</div>
	</div>
</footer>

<!-- Bootstrap core JavaScript -->

 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/js/jquery.dataTables.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	  <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	  <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<jsp:invoke fragment="scripts" />


</body>

</html>
