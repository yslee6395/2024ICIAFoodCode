<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>내 댓글</title>
<script type="text/javascript">
        var contextPath = "${pageContext.request.contextPath}";
    </script>
<script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
	<h1 class="page-title">내 댓글 목록</h1>
	<c:if test="${empty comments}">
		<div class="blank_bottom"></div>
		<h2 class="no-comments">등록한 댓글이 없습니다.</h2>
	</c:if>
	<c:if test="${not empty comments}">
		<div class="blank_bottom"></div>
		<div class="my-comments-list">
			<ul class="my-comments-list-items">
				<c:forEach var="comment" items="${comments}">
					<li class="my-comment-item clickable"
						onclick="redirectToInfo(${comment.cook_no}, '${comment.CKG_NM}')">
						<div class="my-recipe-name">${comment.CKG_NM}</div>
						<div class="my-comment-details">
							<span class="my-comment-content">${comment.content}</span> <span
								class="my-comment-date">${comment.write_date}</span>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<%@ include file="../footer.jsp"%>
</body>
</html>
