<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 북마크</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"; // 컨텍스트 경로를 JavaScript 변수에 저장
	// 스크립트에 주소를 넣으니까 실제 주소에 오류가 발생
</script>
</head>
<body>
	<h1 class="page-title">나의 북마크</h1>
	<c:if test="${empty bookmarks}">
		<div class="blank_bottom"></div>
		<h2 class="no-comments">등록된 북마크가 없습니다.</h2>
	</c:if>
	<c:if test="${not empty bookmarks}">
		<div class="cook-list">
			<c:forEach var="cook" items="${bookmarks}">
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
	</c:if>
	<%@ include file="../footer.jsp"%>
</body>
</html>
