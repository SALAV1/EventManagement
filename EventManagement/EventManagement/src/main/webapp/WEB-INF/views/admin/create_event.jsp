<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

</head>

<body>	
	<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Tạo sự kiện mới
					</div>
					<div class="card-body">	
						<form method="POST" action="#" id="createevent">
							<table align="center">
								<tr>
									<td>Tên sự kiện</td><td><input type="text" name="name" id="name" class="text"></td>
								</tr>
								<tr>
									<td>Số lượng vé</td><td><input type="text" name="tickets" id="tickets" class="text"></td>
								</tr>
								<tr>
									<td>Giá vé</td><td><input type="text" name="fee" id="fee" class="text"></td>
								</tr>
								<tr>
									<td>Đia điểm</td><td><input type="text" name="location" id="location" class="text"></td>
								</tr>
								<tr>
									<td>Thời gian bắt đầu</td><td><input type="date" name="startdate" id="startdate" class="date">&nbsp;<input type="text" name="starthour" id="starthour" class="time"><label>giờ</label><input type="text" name="startminute" id="startminute" class="time"><lable>phút</lable></td>
								</tr>
								<tr>
									<td>Thời gian kết thúc</td><td><input type="date" name="enddate" id="enddate" class="date">&nbsp;<input type="text" name="endhour" id="endhour" class="time"><label>giờ</label><input type="text" name="endminute" id="endminute" class="time"><lable>phút</lable></td>
								</tr>
								<tr>
									<td>Mô tả ngắn</td><td><textarea name="header" id="header" class="text"></textarea></td>
								</tr>
								<tr>
									<td>Mô tả sự kiện</td><td><textarea name="descripttion" id="description" class="text" rows="7"></textarea></td>
								</tr>
								<tr>
									<td>Thông tin mở rộng</td><td><textarea name="advance" id="advance" class="text"></textarea></td>
								</tr>
								<tr>
									<td>Trạng thái</td><td><input type="radio" name="option" value="Published">Published&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="option" value="Draft">Draft</td>
								</tr>
								<tr>
									<td></td><td><button id="btnSubmit">Lưu</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->


		</div>
		<!-- /.content-wrapper -->

	
	<!-- /#wrapper -->
	<script>
		$(document).ready(function(){
			var id = ${id};
			if(id != 0){
				$.ajax({
					url: "http://localhost:8080/EventManagement/api/secure/event/"+${id},
					type: "GET",
					contentType: "application/json",
					dataType: "json",
					success: function(result){
						$('#name').val(result.name);
						$('#fee').val(result.fee);
						$('#tickets').val(result.tickets);
						$('#location').val(result.venuename);
						$('#startdate').val(result.startDate);
						$('#starthour').val(result.startTime.split(':')[0]);
						$('#startminute').val(result.startTime.split(':')[1]);
						$('#enddate').val(result.endDate);
						$('#endhour').val(result.endTime.split(':')[0]);
						$('#endminute').val(result.endTime.split(':')[1]);
						$('#header').val(result.header);
						$('#description').val(result.description);
						$('#advance').val(result.advancedDetails);
						$('input:radio[name=option][value='+result.status+']').attr('checked', true);
					},
					error: function(e){
						alert("Xảy ra lỗi!");
					}
				});
			}
			$('form').submit(function(event) {
				event.preventDefault();

					var data = {
							name: $('#name').val(),
							startDate: $('#startdate').val(),
							startTime: $('#starthour').val()+':'+$('#startminute').val(),
							endDate: $('#enddate').val(),
							endTime: $('#endhour').val()+':'+$('#endminute').val(),
							venuename: $('#location').val(),
							fee: $('#fee').val(),
							description: $('#description').val(),
							userId: 3,
							tickets: $('#tickets').val(),
							sold: 0,
							status: $('input[name="option"]:checked').val(),
							header: $('#header').val(),
							advancedDetails: $('#advance').val()
					};
					if(id == 0){
					$.ajax({
						url: "http://localhost:8080/EventManagement/api/private/newevent",
						type: "POST",
						contentType: "application/json",
						data: JSON.stringify(data),
						dataType: "json",
						success: function(result){
							alert("Sự kiện được tạo thành công!");
						},
						error: function(e){
							alert("Xảy ra lỗi!");
						}
					});
					}
					else{
						var data = {
								eventId: id,
								name: $('#name').val(),
								startDate: $('#startdate').val(),
								startTime: $('#starthour').val()+':'+$('#startminute').val(),
								endDate: $('#enddate').val(),
								endTime: $('#endhour').val()+':'+$('#endminute').val(),
								venuename: $('#location').val(),
								fee: $('#fee').val(),
								description: $('#description').val(),
								tickets: $('#tickets').val(),
								sold: 0,
								status: $('input[name="option"]:checked').val(),
								header: $('#header').val(),
								advancedDetails: $('#advance').val()
						};
						$.ajax({
							url: "http://localhost:8080/EventManagement/api/private/update",
							type: "PUT",
							contentType: "application/json",
							data: JSON.stringify(data),
							dataType: "json",
							success: function(result){
								alert("Cập nhật sự kiện thành công!");
							},
							error: function(e){
								
								alert("Xảy ra lỗi!");
							}
						});
					}
				
			});
			
		});
	</script>
</body>
</html>