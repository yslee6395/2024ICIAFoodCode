<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div style="margin-top: 20px;"></div>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/message.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/message.css">
</head>
<body>
<div class="blank_bottom"></div>
<div class="blank_bottom"></div>
	<div class="message-info">
		<ul class="message-details">
			<li><span class="label">송신자</span><span class="value">${messageInfo.send_id_name}</span></li>
			<li><span class="label">송신자 ID</span><span class="value">${messageInfo.send_id}</span></li>
			<li><span class="label">수신자</span><span class="value">${messageInfo.get_id_name}</span></li>
			<li><span class="label">제목</span><span class="value message-title">${messageInfo.title}</span></li>
			<li><span class="label">내용</span><span class="value message-title">${messageInfo.content}</span></li>
			<li><span class="label">보낸 시각</span><span class="value">${messageInfo.send_date}</span></li>
		</ul>
		<div class="buttons">
			<c:if test="${loginedMemberVo.userid == messageInfo.send_id && loginedMemberVo.userid != messageInfo.get_id}">
				<button class="btn btn-primary"
					onclick="location.href='<c:url value="/message/sendMessageList" />'">목록</button>
			</c:if>
			<c:if test="${loginedMemberVo.userid == messageInfo.get_id && loginedMemberVo.userid != messageInfo.send_id}">
				<button class="btn btn-primary" onclick="location.href='<c:url value="/message" />'">목록</button>
				<button class="btn btn-danger" 
					onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='<c:url value="/message/messageDelete?message_no=${messageInfo.message_no}"/>' }">삭제</button>
			</c:if>
			<c:if test="${loginedMemberVo.userid == messageInfo.get_id && loginedMemberVo.userid == messageInfo.send_id}">
				<button class="btn btn-primary" onclick="location.href='<c:url value="/message" />'">목록</button>
				<button class="btn btn-danger" 
					onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='<c:url value="/message/messageDelete?message_no=${messageInfo.message_no}"/>' }">삭제</button>
			</c:if>
			<button class="btn btn-success"
				onclick="location.href='<c:url value="/message/messageSendForm?message_no=${messageInfo.message_no}"/>'">답장</button>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
