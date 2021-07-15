<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Trang quản lý</title>

</head>

<body>

	

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách sự kiện
						<a href=<c:url value="/create"/> class="btn btn-danger" align="right">Thêm sự kiện</a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>ID</th>
										<th>Sự kiện</th>
										<th>Vé đã bán</th>
										<th>Trạng thái</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>ID</th>
										<th>Sự kiện</th>
										<th>Vé đã bán</th>
										<th>Trạng thái</th>
										<th>Tác vụ</th>
									</tr>
								</tfoot>
								<tbody id="tablebody">
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Event Management 2021</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function() {
		$.ajax({
					url : 'http://localhost:8080/EventManagement/api/secure/event/',
					type : 'GET',
					contentType : 'application/json',
					dataType : 'json',
					success : function(result) {
						result.forEach(function(element) {
							var dates = element.startDate.split('-');
							var date = dates[2]+'-'+dates[1]+'-'+dates[0];
							$("#tablebody").append('<tr><td>'+element.eventId
													+'</td><td><b>'+element.name+'</b><br>'+date+'&nbsp;'+element.startTime+'<br>'+element.venuename
													+'</td><td>'+element.sold+'/'+element.tickets
													+'</td><td>'+element.status
													+'</td><td><a href=<c:url value="/event/'+element.eventId+'" /> class="btn btn-primary btn-sm">Xem</a>&nbsp;<a href="" class="btn btn-warning btn-sm">Dừng đăng kí</a>&nbsp;<a href="" class="btn btn-danger btn-sm" >Xóa</a></td></tr>'
													);
						});
					},
					error : function(error) {
						alert("Xảy ra lỗi khi load dữ liệu!");
					},
		});
});
	</script>
</body>

</html>