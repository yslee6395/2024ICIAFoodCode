<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search.css">
<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"; // 컨텍스트 경로를 JavaScript 변수에 저장
</script>
</head>
<body>
	<div class="search-container">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/list/search" method="get"
			class="search-form">
			<!-- 텍스트 입력 (검색어를 다시 채우기) -->
			<textarea name="word" id="word" placeholder="검색어를 입력해 주세요."
				class="search-textarea" onkeydown="fnEnterkey(event)">${word}</textarea>
			<!-- 검색 버튼 대신 이미지 -->
			<img
				src="${pageContext.request.contextPath}/resources/img/search-icon.png"
				alt="검색" class="search-image" onclick="submitSearchForm(event)" />
		</form>
		<input type="hidden" name="userid" value="${loginedMemberVo.userid}"
			id="userId" /> <a href="javascript:void(0);"
			onclick="checkLoginBeforeRegister()"> <img
			src="${pageContext.request.contextPath}/resources/img/register-icon.png"
			alt="등록" class="search-image" />
		</a>
	</div>
</body>
</html>
