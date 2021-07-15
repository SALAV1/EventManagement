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

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-0"
					src=<c:url value="/template/web/picture/Anh-thien-nhien-1.jpg" /> alt="">
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<h1>Sự kiện sắp diễn ra</h1>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

		<!-- Call to Action Well -->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">This call to action card is a great
					place to showcase some important information or display a clever
					tagline!</p>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row" id="listevent">
			<!-- /.col-md-4 -->
			<div id="test">
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	
<script>
$(document).ready(function(){
	$.ajax({
		url: 'http://localhost:8080/EventManagement/api/public/event/upcoming',
		type: 'GET',
		contentType: 'application/json',
		dataType:'json',
		success: function(result){
			result.forEach(function(element){
				var url = '<c:url value="/su-kien/'+element.eventId+'"/>';
				var startdates = element.startDate.split("-");
				var startdate = startdates[2]+"-"+startdates[1]+"-"+startdates[0];
				var enddates = element.endDate.split("-");
				var enddate = enddates[2]+"-"+enddates[1]+"-"+enddates[0];
				$('#listevent').append('<div class="col-md-6 mb-5">'+
											'<div class="card h-100">'+
												'<div class="card-body">'+
													'<h4 class="card-title">'+element.name+'</h4>'+
													'<p class="card-text">'+'Từ: '+element.startTime+'&nbsp;'+startdate+' - Đến: '+element.endTime+'&nbsp;'+enddate+'<br>'+element.venuename+'<br>'+element.header+'</p>'+
												'</div>'+
												'<div class="card-footer">'+
													'<a href='+url+' class="btn btn-primary btn-sm btInf" data-id="'+element.eventId+'" >More Info</a>'+
												'</div>'+
											'</div>'+
										'</div>');
			});		
		},
		error: function (error){
			alert("Xảy ra lỗi!");
		}
	});
	$(document).on('click', '.btInf' ,function(){
		var id = $(this).attr("data-id");
		alert($(this).attr("data-id"));

	});
  });

</script>

</body>

</html>