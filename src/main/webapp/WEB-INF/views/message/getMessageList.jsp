<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div style="margin-top: 20px;"></div>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>메시지 목록</title>
<script>
	var contextPath = "${pageContext.request.contextPath}";

	// 메시지 상세 페이지로 리디렉션하는 함수
	function redirectToInfo(messageNo) {
		window.location.href = contextPath
				+ "/message/messageDetail?message_no=" + messageNo;
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/message.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/message.css">
</head>
<body>
	<div class="blank_bottom"></div>
	<h1>받은 쪽지함</h1>
	<div class="blank_bottom"></div>
	<div class="message-actions">
		<div class="left-actions">
			<c:if test="${loginedMemberVo.userid != 'admin'}">
				<a class="message-create clickable"
					href="<c:url value='/message/messageSendForm?get_id=admin' />">관리자에게
					문의 하기</a>
			</c:if>
			<a class="message-create clickable"
				href="<c:url value='/message/messageSendForm' />">쪽지 작성</a>
		</div>
		<div class="right-actions">
			<a class="message-create clickable"
				href="<c:url value='/message/sendMessageList' />">보낸 쪽지함</a>
		</div>
	</div>

	<!-- 메시지 목록 출력 -->
	<div class="message-list">
		<c:forEach var="message" items="${messageList}">
			<div class="message-item">
				<div class="message-details">
					<span class="sender">${message.send_id_name}</span> <span
						class="title clickable"
						onclick="redirectToInfo('${message.message_no}')"> <strong>${message.title}</strong>
					</span> <span class="date">${message.send_date.substring(5, 10)}</span>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 페이지네이션 -->
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<!-- 첫 번째 페이지로 이동 -->
			<a href="?page=1">첫 페이지</a>
			<!-- 이전 페이지로 이동 -->
			<a href="?page=${currentPage - 1}"
				<c:if test="${currentPage == 1}">class="disabled"</c:if>>« 이전</a>
		</c:if>

		<!-- 페이지 번호들 -->
		<c:forEach var="i" begin="1" end="${totalPages}">
			<c:choose>
				<c:when test="${i == currentPage}">
					<span class="current">${i}</span>
					<!-- 현재 페이지 강조 -->
				</c:when>
				<c:otherwise>
					<a href="?page=${i}">${i}</a>
					<!-- 다른 페이지 링크 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${currentPage < totalPages}">
			<!-- 다음 페이지로 이동 -->
			<a href="?page=${currentPage + 1}">다음 »</a>
			<!-- 마지막 페이지로 이동 -->
			<a href="?page=${totalPages}">마지막 페이지</a>
		</c:if>
	</div>

	<!-- 메시지가 없을 경우 -->
	<c:if test="${empty messageList}">
		<h3 style="text-align: center;">받은 쪽지가 없습니다.</h3>
	</c:if>
	<%@ include file="../footer.jsp"%>
</body>
</html>
