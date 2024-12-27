<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div style="margin-top: 20px;"></div>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>메시지 작성</title>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/message.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/message.css">

</head>
<body>
	<form action="messageSend" method="POST" class="message-form"
		name="frm" onsubmit="return titleCheck()">
		<div class="form-group">
			<label for="sender">송신자</label> <span id="sender"
				class="form-control">${loginedMemberVo.name}</span>
			<!-- 텍스트로 변경 -->
			<input type="hidden" name="send_id" value="${loginedMemberVo.userid}">
		</div>

		<c:if test="${not empty message.get_id_no || not empty admin_get_id}">
			<div class="form-group">
				<label for="receiver">수신자 ID</label>
				<c:if test="${loginedMemberVo.userid == message.get_id}">
					<span id="receiver" class="form-control">${message.send_id_name}</span>
					<input type="hidden" name="get_id" value="${message.send_id}">
				</c:if>
				<c:if test="${loginedMemberVo.userid == message.send_id}">
					<span id="receiver" class="form-control">${message.get_id_name}</span>
					<input type="hidden" name="get_id" value="${message.get_id}">
				</c:if>
				<c:if test="${not empty admin_get_id}">
					<span id="admin" class="form-control">관리자</span>
					<input type="hidden" name="get_id" value="${admin_get_id}">
				</c:if>
			</div>
		</c:if>

		<c:if test="${empty message.get_id_no && empty admin_get_id}">
			<div class="form-group">
				<label for="receiver">수신자 ID</label> <input type="text"
					id="receiver" class="form-control" name="get_id">
			</div>

		</c:if>

		<div class="form-group">
			<label for="title">제목</label> <input type="text" id="title"
				class="form-control" name="title">
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea id="content" class="form-control-content" name="content"
				resize="none"></textarea>
		</div>

		<div class="form-group">
			<input type="submit" value="보내기" class="btn-submit">
			<button type="button" class="btn-submit"
				onclick="location.href='<c:url value="/message" />'">목록</button>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>
