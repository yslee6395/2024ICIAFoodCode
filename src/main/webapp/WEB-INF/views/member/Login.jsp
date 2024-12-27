<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
	<div class="login-container">
		<h2>로그인</h2>
		<form action="/cook/member/loginConfirm" method="post" name="frm"
			class="login-form">
			<div class="form-group">
				<label for="userid">아이디</label> <input type="text" name="userid"
					id="userid" class="input-field">
			</div>
			<div class="form-group">
				<label for="pwd">암호</label> <input type="password" name="pwd"
					id="pwd" class="input-field">
			</div>
			<c:if test="${not empty message}">
				<div class="form-error">${message}</div>
			</c:if>
			<div class="form-actions">
				<input type="submit" value="로그인" class="btn btn-primary"
					onclick="return loginCheck()"> <input type="button"
					onclick="location.href='findPwdForm'" value="비밀번호 찾기"
					class="btn btn-primary"> <input type="button"
					value="회원 가입" onclick="location.href='join'"
					class="btn btn-primary">
			</div>
		</form>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
