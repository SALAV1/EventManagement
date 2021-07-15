<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<!-- Custom fonts for this template-->
<link href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="<c:url value='/template/admin/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="<c:url value='/template/admin/css/sb-admin.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/template/admin/css/newevent.css'/>" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body id="page-top">
	<%@ include file="/common/admin/header.jsp" %>
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href=<c:url value="/home"/>> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Events</span>
			</a></li>
		</ul>
		
		<dec:body/>
	</div>
	
	
	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

	<!-- Page level plugin JavaScript-->
	<script src="<c:url value='/template/admin/vendor/chart.js/Chart.min.js'/>"></script>
	<script src="<c:url value='/template/admin/vendor/datatables/jquery.dataTables.js'/>"></script>
	<script src="<c:url value='/template/admin/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/template/admin/js/sb-admin.min.js'/>"></script>

	<!-- Demo scripts for this page-->
	<script src="<c:url value='/template/admin/js/demo/datatables-demo.js'/>"></script>
	<script src="<c:url value='/template/admin/js/demo/chart-area-demo.js'/>"></script>


</body>
</html>