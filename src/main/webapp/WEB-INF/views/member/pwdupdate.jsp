<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
    <%@ include file="../header.jsp"%>
    <div class="password-change-container">
        <h2 class="password-change-title">비밀번호 변경</h2>
        <form action="/cook/member/pwdUpdateConfirm" method="post" name="frm" class="password-change-form">
            <ul class="password-change-form-list">
                <li class="form-item">
                    <label for="userid" class="form-label">아이디</label>
                    <input type="text" id="userid" name="userid" class="input-field" value="${loginedMemberVo.userid}" readonly>
                </li>
                <li class="form-item">
                    <label for="pwd" class="form-label">현재 암호</label>
                    <input type="password" id="pwd" name="pwd" class="input-field">
                </li>
                <li class="form-item">
                    <label for="new_pwd" class="form-label">새로운 암호</label>
                    <input type="password" id="new_pwd" name="new_pwd" class="input-field">
                </li>
                <li class="form-item password-change-actions">
                    <input type="submit" value="확인" class="btn-submit" onclick="return loginCheck()">
                </li>
                <c:if test="${not empty message}">
                    <li class="form-item error-message">
                        <span>${message}</span>
                    </li>
                </c:if>
            </ul>
        </form>
    </div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
