<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
	<div class="delete-account-container">
		<h2 class="delete-account-title">회원 탈퇴</h2>
		<!-- 탈퇴 폼 -->
		<form action="/cook/member/deleteConfirm" method="post" name="frm"
			class="delete-form">
			<ul class="delete-form-list">
				<li class="delete-form-item"><label for="pwd"
					class="delete-form-label">비밀번호</label> <input type="password"
					id="pwd" name="pwd" class="delete-input-field" required /></li>
				<li class="delete-form-item delete-actions"><input
					type="button" onclick="redirectToDelete()" value="회원탈퇴"
					class="delete-btn-submit" /></li>
			</ul>
		</form>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
