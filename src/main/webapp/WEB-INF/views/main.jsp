<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./header.jsp"%>
<div style="margin-top: 20px;"></div>
<%@ include file="./search/search.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
<script>
	        var contextPath = "${pageContext.request.contextPath}"; // 컨텍스트 경로를 JavaScript 변수에 저장
	    </script>
</head>
<body>

	<!-- 레시피 목록 출력 -->
	<c:if test="${empty cookList}">
		<h1 style="text-align: center;">등록된 레시피가 없습니다.</h1>
	</c:if>

	<c:if test="${not empty cookList}">
		<div class="cook-list">
			<c:forEach var="cook" items="${cookList}">
				<div class="cook-item clickable"
					onclick="redirectToInfo(${cook.cook_no}, '${cook.CKG_NM}')">
					<div class="cook-image">
						<img src="<c:url value='/libraryUploadImg/${cook.CKG_IMG_URL}' />"
							alt="${cook.CKG_NM}">
					</div>
					<div class="cook-info">
						<div class="cook-name">${cook.CKG_NM}</div>
						<div class="read-count">${cook.read_count}views</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이지네이션 -->
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="?page=1">첫 페이지</a>
				<a href="?page=${currentPage - 1}">« 이전</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${totalPage}">
				<c:choose>
					<c:when test="${i == currentPage}">
						<span class="current">${i}</span>
					</c:when>
					<c:otherwise>
						<a href="?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${currentPage < totalPage}">
				<a href="?page=${currentPage + 1}">다음 »</a>
				<a href="?page=${totalPage}">마지막 페이지</a>
			</c:if>
		</div>

	</c:if>
	<%@ include file="./footer.jsp"%>

</body>
</html>
