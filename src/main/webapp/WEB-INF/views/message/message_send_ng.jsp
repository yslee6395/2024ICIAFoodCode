<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div style="margin-top: 20px;"></div>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>메시지 보내기 실패</title>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/message.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/message.css">
</head>
<body>
	<div class="message-confirm message-confirm-fail">
		<h1>등록된 아이디가 없습니다.</h1>
		<a href="<c:url value='/message/' />">받은 쪽지함</a> <a href="<c:url value='/message/messageSendForm' />">쪽지 작성</a>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>