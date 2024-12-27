<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</head>
<body>
	<div class="mypage-container">
		<h1 class="mypage-title">마이페이지</h1>
		<div class="button-row">
			<button class="mpbtn btn-info"
				onclick="location.href='<c:url value="/member/memberUpdateForm" />'">
				내 정보 수정</button>
			<button class="mpbtn btn-warning"
				onclick="location.href='<c:url value="/member/pwdUpdate" />'">
				비밀번호 변경</button>
			<button class="mpbtn btn-danger"
				onclick="location.href='<c:url value="/member/deletePwdCheck" />'">
				회원 탈퇴</button>
			<button class="mpbtn btn-primary2"
				onclick="location.href='<c:url value="/board/myComment" />'">
				내가 쓴 댓글</button>
			<button class="mpbtn btn-success"
				onclick="location.href='<c:url value="/list/myBookmark" />'">
				북마크</button>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
