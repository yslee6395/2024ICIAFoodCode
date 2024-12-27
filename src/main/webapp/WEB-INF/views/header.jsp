<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</head>
<body>
	<header>
		<nav>
			<ul class="My-site">
				<li><a href="<c:url value='/list' />">푸드코드</a></li>
			</ul>
			<ul class="flex-menu">
				<c:if test="${empty loginedMemberVo.userid}">
					<li><a href="<c:url value='/list' />">홈</a></li>
					<li class="dropdown"><a href="javascript:void(0)">카테고리</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/list/filter?category=한식' />">한식</a></li>
							<li><a href="<c:url value='/list/filter?category=중식' />">중식</a></li>
							<li><a href="<c:url value='/list/filter?category=일식' />">일식</a></li>
							<li><a href="<c:url value='/list/filter?category=양식' />">양식</a></li>
							<li><a href="<c:url value='/list/filter?category=기타' />">기타</a></li>
						</ul></li>
					<li><a href="<c:url value='/list/ranking' />">랭킹</a></li>
					<li><a href="<c:url value='/member/loginForm' />">로그인</a></li>
				</c:if>
				<c:if test="${not empty loginedMemberVo.userid}">
					<c:if test="${loginedMemberVo.userid != 'admin'}">
						<!-- 일반 사용자 -->
						<li><a href="<c:url value='/list' />">홈</a></li>
						<li class="dropdown"><a href="javascript:void(0)">카테고리</a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/list/filter?category=한식' />">한식</a></li>
								<li><a href="<c:url value='/list/filter?category=중식' />">중식</a></li>
								<li><a href="<c:url value='/list/filter?category=일식' />">일식</a></li>
								<li><a href="<c:url value='/list/filter?category=양식' />">양식</a></li>
								<li><a href="<c:url value='/list/filter?category=기타' />">기타</a></li>
							</ul></li>
						<li><a href="<c:url value='/list/ranking' />">랭킹</a></li>
						<li><a href="<c:url value='/member/myPage' />">마이페이지</a></li>
						<li><a href="<c:url value='/member/logoutConfirm' />"
							onclick="return logoutCheck()">로그아웃</a></li>
						<li><a href="<c:url value='/message' />">쪽지함</a></li>
						<li class="welcome-message">&nbsp;&nbsp;&nbsp;${loginedMemberVo.name}님&nbsp;</li>
					</c:if>
					<c:if test="${loginedMemberVo.userid == 'admin'}">
						<!-- 관리자 -->
						<li><a href="<c:url value='/list' />">홈</a></li>
						<li><a href="<c:url value='/list/recipeList' />">레시피 등록</a></li>
						<li><a href="<c:url value='/member/logoutConfirm' />"
							onclick="return logoutCheck()">로그아웃</a></li>
						<li><a href="<c:url value='/message' />">쪽지함</a></li>
						<li class="welcome-message">&nbsp;&nbsp;관리자 모드</li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</header>
</body>
</html>
