<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</head>
<body>
	<div class="login-container">
		<h2>비밀번호 찾기</h2>
		<form action="<c:url value='/member/findPwdConfirm' />" method="post"
			name="findpwdform">
			<div class="form-group">
				<input type="text" name="userid" placeholder="ID를 입력하세요."
					class="input-field">
			</div>
			<div class="form-group">
				<input type="text" name="name" placeholder="이름을 입력하세요."
					class="input-field">
			</div>
			<div class="form-group">
				<input type="text" name="email" placeholder="Email을 입력하세요."
					class="input-field">
			</div>
			<div class="button-container">
				<input type="button" value="비밀번호 찾기" onclick="findPasswordForm();"
					class="btn btn-fndpwd">
			</div>
		</form>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
