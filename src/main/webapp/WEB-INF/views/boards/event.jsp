<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/6da1745729.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="/resources/static/css/header.css" />
<link rel="stylesheet" href="/resources/static/css/main.css" />
<link rel="stylesheet" href="/resources/static/css/footer.css" />
<script src="/resources/static/js/main.js"></script>
<script src="/resources/static/js/header.js" defer></script>
<title>SMARTDC</title>
</head>

<body>
	<main class="main-content">
		<style>
.event_container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	margin: 30px auto;
	max-width: 1110px;
}

.event_list {
	margin: 10px;
	padding: 0 8px;
	min-width: 200px;
	height: 430px;
	border: 1px solid #b9b9b9;
	border-radius: 5px;
	margin-bottom: 30px;
}

.event_list img {
	padding-top: 8px;
	display: block;
	width: 100%;
	height: 320px;
	margin: 0 auto;
	object-fit: cover;
	border-radius: 5px;
}

.event_info p, h3 {
	text-align: center;
}

.event_info>p {
	color: #727272;
}

.event_list button {
	display: block;
	margin: auto;
	background-color: green;
	color: white;
	border: 0;
	border-radius: 5px;
	padding: 3px 8px;
	font-size: 12px;
	cursor: pointer;
}

.top_nav {
	background-color: #f3f3f3;
	width: 100%;
}

.topp {
	margin: 0 auto;
	max-width: 1110px;
	text-align: left;
	padding-left: 20px;
	height: 48px;
	line-height: 48px;
	font-size: 11px;
	color: gray;
	display: flex;
}

.eventbox1 {
	margin: 10px;
	width: 300px;
	height: 48px;
	border: 1px solid #323332;
	font-size: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #e43680;
	
}
.eventbox2 {
	margin: 10px;
	width: 300px;
	height: 48px;
	border: 1px solid #323332;
	font-size: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	
}

.eventday {
	margin: 10px;
	width: 200px;
	height: 48px;
	font-size: 11px;
	display: flex;
	justify-content: left;
}

.event_info {
	margin-top: 25px;
}

.page {
	text-align: center;
	margin-bottom: 50px;
	font-size: 13px;
}
</style>


		<div style="margin-top: 48px"></div>
		<div class="top_nav">
			<div class="topp">이벤트 > Event</div>
		</div>
		<div class="topp">
			<div class="eventday">
				오늘날짜 :
				<!-- 현재날짜 -->
				<c:set var="today" value="<%=new java.util.Date()%>" />

				<c:set var="date">
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
				</c:set>
				<c:out value="${date}" />

			</div>
			<a class="eventbox1" href="/boards/event">진행중인 이벤트 ${user.mem_id}</a>

			<a class="eventbox2" href="/boards/endevent">종료된 이벤트 </a>

		</div>
		<div class="event_container">



			<c:forEach items="${eventboardlist}" var="event" begin="0" end="5">
				<div class="event_list">
					<a href="/boards/readView?board_id=${event.board_id}"> <img
						src="/resources/static/eventimg/${event.board_content}.jpg" alt="" />
					</a>
					<div class="event_info">
						<a href="/boards/readView?board_id=${event.board_id}">
							<h3>
								<c:out value="${event.board_title}" />
							</h3>
						</a>
						<p>
							이벤트 기간 :
							<c:out value="${event.s_date}" />
							~
							<c:out value="${event.e_date}" />
						</p>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="page">1 / 2 / 3 / 4 / 5 ...</div>

		<c:set var="memid" value="${user.mem_id}" />
		<c:if test="${memid eq 'asd12321'}">
			<a href="/boards/eventinsertView">이벤트글쓰기</a>
		</c:if>
	</main>
</body>
</html>