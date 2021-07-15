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
			  	<h1 id="event_name"></h1><br>
			  	<div id="description">
			  	</div>
			  	
			  </div>
		</div>
		<div class="col-md-5">
			<h3>Thời gian và địa điểm </h3>
			Thời gian bắt đầu:&nbsp;<label id="start_time"></label><br>
			Thời gian kết thúc:&nbsp;<label id="end_time"></label><br>
			Địa điểm:&nbsp;<label id="location"></label> <br>
			Giá vé: &nbsp;<label id="fee"></label>
			<br><button>Đặt vé</button>
		</div>
	</div>
</div>
	<script>
		$(document).ready(function(){
			$.ajax({
				url: "http://localhost:8080/EventManagement/api/public/event/"+${id},
				type: "GET",
				contentType: "application/json",
				dataType: "json",
				success: function(result){
					$('#event_name').append(result.name);
					$('#start_time').append(result.startDate+"   "+result.startTime);
					$('#end_time').append(result.endDate+"   "+result.endTime);
					$('#location').append(result.venuename);
					$('#fee').append(result.fee);
					$('#description').append(result.description);
				},
				error: function (er){
					alert("Xảy ra lỗi khi load dữ liệu!");
				}
			});
			
		});
	</script>
</body>
</html>