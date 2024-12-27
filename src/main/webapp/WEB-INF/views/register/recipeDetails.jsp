<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div style="margin-top: 20px;"></div>
<%@ include file="../search/search.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/register.css">
<script
	src="${pageContext.request.contextPath}/resources/js/register.js"></script>
</head>
<body>
	<div class="blank_bottom"></div>

	<h2>레시피 등록</h2>
	<p>' * ' 표시 항목은 필수 입력 항목입니다.</p>
	<form id="registerForm" action="/cook/list/registerRecipe" method="post"
		enctype="multipart/form-data" name="register_form"
		onsubmit="return registerForm(event)">
		<input type="hidden" name="recipe_no" value="${recipeInfo.recipe_no}"
			id="recipe_no" />

		<div class="form-group">
			<label for="CKG_NM">요리 이름 *</label> <input type="text" name="CKG_NM"
				id="CKG_NM" size="20" value="${recipeInfo.CKG_NM}">
		</div>

		<c:choose>
			<c:when test="${not empty recipeInfo.CKG_IMG_URL}">
				<div class="form-group">
					<label for="CKG_IMG_URL">요리 이미지</label> <img
						src="<c:url value="/libraryUploadImg/${recipeInfo.CKG_IMG_URL}" />"
						width="200" height="200" alt="${recipeInfo.CKG_IMG_URL}"> <input
						type="hidden" name="CKG_IMG_URL" value="${recipeInfo.CKG_IMG_URL}" />
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group">
					<label for="CKG_IMG_FILE">요리 이미지 *</label> <input type="file"
						name="CKG_IMG_FILE" value="${recipeInfo.CKG_IMG_URL}">
				</div>
			</c:otherwise>
		</c:choose>

		<div class="form-group">
			<label for="CKG_INBUN_NM">요리 인분 *</label> <input type="text"
				name="CKG_INBUN_NM" id="CKG_INBUN_NM" size="20"
				value="${recipeInfo.CKG_INBUN_NM}">
		</div>

		<div class="form-group">
			<label for="CKG_TIME_NM">소요 시간 *</label> <input type="text"
				name="CKG_TIME_NM" id="CKG_TIME_NM" size="20"
				value="${recipeInfo.CKG_TIME_NM}">
		</div>

		<div class="form-group">
			<label for="CKG_KND_ACTO_NM">분류 *</label> <select
				name="CKG_KND_ACTO_NM" id="CKG_KND_ACTO_NM">
				<option value="1"
					<c:if test="${recipeInfo.CKG_KND_ACTO_NM == '한식'}">selected</c:if>>한식</option>
				<option value="2"
					<c:if test="${recipeInfo.CKG_KND_ACTO_NM == '중식'}">selected</c:if>>중식</option>
				<option value="3"
					<c:if test="${recipeInfo.CKG_KND_ACTO_NM == '일식'}">selected</c:if>>일식</option>
				<option value="4"
					<c:if test="${recipeInfo.CKG_KND_ACTO_NM == '양식'}">selected</c:if>>양식</option>
				<option value="5"
					<c:if test="${recipeInfo.CKG_KND_ACTO_NM == '기타'}">selected</c:if>>기타</option>
			</select>
		</div>

		<div class="form-group">
			<label for="CKG_MTRL_CN">재료 *</label> <input type="text"
				name="CKG_MTRL_CN" id="CKG_MTRL_CN" size="20"
				value="${recipeInfo.CKG_MTRL_CN}">
		</div>

		<ul>
			<li class="form-group"><label for="step1">레시피 1 *</label> <input
				type="text" name="step1" id="step1" value="${recipeInfo.step1}"></li>
			<li class="form-group"><label for="step2">레시피 2</label> <input
				type="text" name="step2" id="step2" value="${recipeInfo.step2}"></li>
			<li class="form-group"><label for="step3">레시피 3</label> <input
				type="text" name="step3" id="step3" value="${recipeInfo.step3}"></li>
			<li class="form-group"><label for="step4">레시피 4</label> <input
				type="text" name="step4" id="step4" value="${recipeInfo.step4}"></li>
			<li class="form-group"><label for="step5">레시피 5</label> <input
				type="text" name="step5" id="step5" value="${recipeInfo.step5}"></li>
			<li class="form-group"><label for="step6">레시피 6</label> <input
				type="text" name="step6" id="step6" value="${recipeInfo.step6}"></li>
			<li class="form-group"><label for="step7">레시피 7</label> <input
				type="text" name="step7" id="step7" value="${recipeInfo.step7}"></li>
			<li class="form-group"><label for="step8">레시피 8</label> <input
				type="text" name="step8" id="step8" value="${recipeInfo.step8}"></li>
			<li class="form-group"><label for="step9">레시피 9</label> <input
				type="text" name="step9" id="step9" value="${recipeInfo.step9}"></li>
			<li class="form-group"><label for="step10">레시피 10</label> <input
				type="text" name="step10" id="step10" value="${recipeInfo.step10}"></li>
			<li class="form-group"><label for="step11">레시피 11</label> <input
				type="text" name="step11" id="step11" value="${recipeInfo.step11}"></li>
			<li class="form-group"><label for="step12">레시피 12</label> <input
				type="text" name="step12" id="step12" value="${recipeInfo.step12}"></li>
			<li class="form-group"><label for="step13">레시피 13</label> <input
				type="text" name="step13" id="step13" value="${recipeInfo.step13}"></li>
			<li class="form-group"><label for="step14">레시피 14</label> <input
				type="text" name="step14" id="step14" value="${recipeInfo.step14}"></li>
			<li class="form-group"><label for="step15">레시피 15</label> <input
				type="text" name="step15" id="step15" value="${recipeInfo.step15}"></li>
			<li class="form-group"><label for="step16">레시피 16</label> <input
				type="text" name="step16" id="step16" value="${recipeInfo.step16}"></li>
			<li class="form-group"><label for="step17">레시피 17</label> <input
				type="text" name="step17" id="step17" value="${recipeInfo.step17}"></li>
			<li class="form-group"><label for="step18">레시피 18</label> <input
				type="text" name="step18" id="step18" value="${recipeInfo.step18}"></li>
			<li class="form-group"><label for="step19">레시피 19</label> <input
				type="text" name="step19" id="step19" value="${recipeInfo.step19}"></li>
			<li class="form-group"><label for="step20">레시피 20</label> <input
				type="text" name="step20" id="step20" value="${recipeInfo.step20}"></li>
		</ul>

		<div class="form-actions">
			<input type="submit" value="등록">
			<button type="button" class="delete-button" onclick="deleteRecipe(${recipeInfo.recipe_no}, '${recipeInfo.CKG_NM}', event)">삭제</button>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>
