<%@page import="team.dao.TypeDAO"%>
<%@page import="team.dto.TypeDTO"%>
<%@page import="team.dao.CityDAO"%>
<%@page import="team.dto.CityDTO"%>
<%@page import="team.dto.ConcertDTO"%>
<%@page import="java.util.List"%>
<%@page import="team.dao.ConcertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<title>관리자 페이지</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./stylesheets/w3.css">
<link rel="stylesheet" href="./stylesheets/fonts_googleapis.css">
<link rel="stylesheet" href="./stylesheets/common.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="./javascripts/jquery-3.2.1.min.js"></script>
<body>
	<

	<!-- Top menu -->
	<jsp:include page="top.jsp"/>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px">
		<div class="w3-row-padding w3-padding-16 w3-center " id="food">
			<div class="w3-third" style="height: 600px;">
			
				<div class="w3-panel w3-padding-32">공연 관리</div>
				<%
					List<ConcertDTO> concertList = ConcertDAO.getAllList();
					pageContext.setAttribute("list1", concertList);
				%>
				<table class="w3-table w3-bordered">
					<c:forEach begin="0" end="5" var="data">
					<tr><td>
						${pageScope.list1[data].name}&nbsp;&nbsp;&nbsp;
						${pageScope.list1[data].place}
					</td></tr>
					</c:forEach>
				</table>
				<div class="w3-panel w3-padding-32">
					<a href="manageConcert.jsp">
						<button class="w3-button w3-black w3-round">더보기</button>
					</a>
				</div>
				
			</div>
			<div class="w3-third" style="height: 600px;">
				<div class="w3-panel w3-padding-32">지역 관리</div>
				<%
					List<CityDTO> cityList = CityDAO.getAllList();
					pageContext.setAttribute("list2", cityList);
				%>
				<table class="w3-table w3-bordered">
					<c:forEach begin="0" end="5" var="data">
					<tr><td>
						${pageScope.list2[data].cityNum}&nbsp;&nbsp;&nbsp;
						${pageScope.list2[data].cityName}
					</td></tr>
					</c:forEach>
				</table>
				<div class="w3-panel w3-padding-32">
					<a href="manageCity.jsp">
						<button class="w3-button w3-black w3-round">더보기</button>
					</a>
				</div>
			</div>
			<div class="w3-third" style="height: 600px;">
				<div class="w3-panel w3-padding-32">타입 관리</div>
				<%
					List<TypeDTO> typeList = TypeDAO.getAllList();
					pageContext.setAttribute("list3", typeList);
				%>
				<table class="w3-table w3-bordered">
					<c:forEach begin="0" end="5" var="data">
					<tr><td>
						${pageScope.list3[data].typeNum}&nbsp;&nbsp;&nbsp;
						${pageScope.list3[data].typeName}
					</td></tr>
					</c:forEach>
				</table>
				<div class="w3-panel w3-padding-32">
					<a href="manageType.jsp">
						<button class="w3-button w3-black w3-round">더보기</button>
					</a>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="footer.jsp"/>
	</div>


</body>
</html>