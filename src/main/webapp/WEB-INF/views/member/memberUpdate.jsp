<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
	<div class="update-container">
		<h2 class="update-title">회원 수정</h2>
		<form action="/cook/member/memberUpdateConfirm" method="post"
			name="frm" class="update-form">
			<ul class="update-form-list">
				<li class="form-item"><label for="name" class="form-label">이름</label>
					<input type="text" name="name" id="name" class="input-field"
					value="${loginedMemberVo.name}"></li>
				<li class="form-item"><label for="userid" class="form-label">아이디</label>
					<input type="text" name="userid" id="userid" class="input-field"
					value="${loginedMemberVo.userid}" readonly></li>
				<li class="form-item"><label for="email" class="form-label">이메일</label>
					<input type="text" name="email" id="email" class="input-field"
					value="${loginedMemberVo.email}"></li>
				<li class="form-item"><label for="phone" class="form-label">전화번호</label>
					<input type="text" name="phone" id="phone" class="input-field"
					value="${loginedMemberVo.phone}"></li>
				<li class="form-item"><label for="gender" class="form-label">성별</label>
					<select name="gender" id="gender" class="input-field">
						<option value="1"
							<c:if test="${loginedMemberVo.gender == '1'}">selected</c:if>>남성</option>
						<option value="2"
							<c:if test="${loginedMemberVo.gender == '2'}">selected</c:if>>여성</option>
				</select></li>
				<li class="form-item form-actions"><input type="submit"
					value="확인" class="btn-submit" onclick="return joinCheck()">
				</li>
			</ul>
		</form>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
