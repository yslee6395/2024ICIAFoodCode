<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
	<div class="join-container">
		<h2>회원 가입</h2>
		<p>' * ' 표시 항목은 필수 입력 항목입니다.</p>
		<form action="/cook/member/joinConfirm" method="post" name="frm" class="register-form">
			<input type="hidden" name="admin" value="0" />
			<div class="form-group">
				<label for="name">이름 *</label>
				<input type="text" name="name" id="name" class="input-field">
			</div>
			<div class="form-group">
				<label for="userid">아이디 *</label>
				<div class="input-with-button">
					<input type="text" name="userid" id="userid" class="input-field">
					<input type="hidden" name="reid">
					<input type="button" value="중복 체크" class="btn btn-idCheck" onclick="return idCheck()">
				</div>
			</div>
			<div class="form-group">
				<label for="pwd">암 호 *</label>
				<input type="password" name="pwd" id="pwd" class="input-field">
			</div>
			<div class="form-group">
				<label for="pwd_check">암호 확인 *</label>
				<input type="password" name="pwd_check" id="pwd_check" class="input-field">
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" name="email" id="email" class="input-field">
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<input type="text" name="phone" id="phone" class="input-field">
			</div>
			<div class="form-group">
				<label for="gender">성별</label>
				<select name="gender" id="gender" class="input-field">
					<option value="1">남성</option>
					<option value="2">여성</option>
				</select>
			</div>
			<c:if test="${not empty message}">
				<div class="form-error">${message}</div>
			</c:if>
			<div class="form-actions">
				<input type="submit" value="확인" class="btn btn-join" onclick="return joinCheck()">
				<input type="reset" value="취소" class="btn btn-reset">
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/member.js"></script>
		<%@ include file="../footer.jsp"%>
</body>
</html>
