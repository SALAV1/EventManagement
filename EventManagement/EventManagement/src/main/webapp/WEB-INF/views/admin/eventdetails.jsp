<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Trang chủ</title>
</head>

<body>
<div class="container">
	<div class="row">
		<div class="col-md-7">
			  <div>
			  	<img src=<c:url value="/template/web/picture/Anh-thien-nhien-1.jpg"/> style="width:100%; height: 400px;"/>
			  	
			  </div>
		</div>
		<div class="col-md-5">
			<h3>Thời gian và địa điểm </h3>
			Thời gian bắt đầu:&nbsp;<label id="start_time"></label><br>
			Thời gian kết thúc:&nbsp;<label id="end_time"></label><br>
			Địa điểm:&nbsp;<label id="location"></label> <br>
			Giá vé: &nbsp;<label id="fee"></label><br>
			Vé đã bán: &nbsp;<label id="tickets"></label><br>
			Trạng thái: &nbsp;<label id="status"></label><br>
			<a href=<c:url value="/edit/${id}"/>  class="btn btn-primary btn-sm">Cập nhật thông tin</a>
			<a href=<c:url value="/edit/${id}"/>  class="btn btn-secondary btn-sm">Sao chép URL</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
				<h1 id="event_name"></h1><br>
			  	<label id="description"></label>
			  	<br>
			  	<h4 id="advanceddetails">Thông tin mở rộng</h4>
		</div>
	</div>
</div>
	<script>
		$(document).ready(function(){
			$.ajax({
				url: "http://localhost:8080/EventManagement/api/secure/event/"+${id},
				type: "GET",
				contentType: "application/json",
				dataType: "json",
				success: function(result){
					$('#event_name').append(result.name);
					$('#start_time').append(result.startDate+"   "+result.startTime);
					$('#end_time').append(result.endDate+"   "+result.endTime);
					$('#location').append(result.venuename);
					$('#fee').append(result.fee);
					$('#tickets').append(result.sold+'/'+result.tickets);
					$('#status').append(result.status);
					$('#description').append(result.description);
					$('#advanceddetails').append(result.advancedDetails);
				},
				error: function (er){
					alert("Xảy ra lỗi khi load dữ liệu!");
				}
			});
			
		});
	</script>
</body>
</html>