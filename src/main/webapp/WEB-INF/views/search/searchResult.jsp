<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../header.jsp"%>
<div style="margin-top: 20px;"></div>
<%@ include file="../search/search.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
<script>
        var contextPath = "${pageContext.request.contextPath}"; // 컨텍스트 경로를 JavaScript 변수에 저장
    </script>
</head>
<body>
	<c:if test="${empty searchResults}">
	<div class="blank_bottom"></div>
		<h1 style="text-align: center;">등록된 레시피가 없습니다.</h1>
	</c:if>
	<c:if test="${not empty searchResults}">
		<div class="cook-list">
			<c:forEach var="cook" items="${searchResults}">
				<div class="cook-item clickable"
					onclick="redirectToInfo(${cook.cook_no}, '${cook.CKG_NM}')">
					<div class="cook-image">
						<img src="<c:url value='/libraryUploadImg/${cook.CKG_IMG_URL}' />"
							alt="${cook.CKG_NM}">
					</div>
					<div class="cook-info">
						<div class="cook-name">${cook.CKG_NM}</div>
						<div class="read-count">${cook.read_count} views</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<%@ include file="../footer.jsp"%>
</body>
</html>
