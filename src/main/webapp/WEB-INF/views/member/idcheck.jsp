<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</head>
<body>
    <div class="id-check-container">
        <h2>아이디 중복확인</h2>
        <form name="frm" class="id-check-form">
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" name="userid" id="userid" class="input-field" value="${userid}">
            </div>

            <c:if test="${isAvailable == 1}">
                <div class="form-message error">
                    <script type="text/javascript">
                        opener.document.frm.userid.value = "";
                    </script>
                    <p>${userid}는 이미 사용 중인 아이디입니다.</p>
                </div>
            </c:if>

            <c:if test="${isAvailable == -1}">
                <div class="form-message success">
                    <p>${userid}는 사용 가능한 아이디입니다.</p>
                    <input type="button" value="사용" class="btn btn-idok" onclick="idok('${userid}')">
                </div>
            </c:if>
        </form>
    </div>
</body>
</html>
