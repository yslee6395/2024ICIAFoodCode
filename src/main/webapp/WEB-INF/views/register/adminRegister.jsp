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
<title>레시피 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<script
	src="${pageContext.request.contextPath}/resources/js/register.js"></script>
<script>
        var contextPath = "${pageContext.request.contextPath}"; // 컨텍스트 경로를 JavaScript 변수에 저장
    </script>
</head>
<body>
	<c:if test="${empty recipeList}">
		<div class="blank_bottom"></div>
		<h1 style="text-align: center;">등록된 레시피가 없습니다.</h1>
	</c:if>
	<c:if test="${not empty recipeList}">
		<div class="cook-list">
			<c:forEach var="recipe" items="${recipeList}">
				<div class="cook-item clickable"
					onclick="redirectToRecipeDetails(${recipe.recipe_no}, '${recipe.CKG_NM}')">
					<div class="cook-image">
						<img
							src="<c:url value='/libraryUploadImg/${recipe.CKG_IMG_URL}' />"
							alt="${recipe.CKG_NM}">
					</div>
					<div class="cook-info">
						<div class="cook-name">${recipe.CKG_NM}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<%@ include file="../footer.jsp"%>
</body>
</html>
