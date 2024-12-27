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
<title>요리 상세정보</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"; // 컨텍스트 경로를 JavaScript 변수에 저장
	// 스크립트에 주소를 넣으니까 실제 주소에 오류가 발생
</script>
</head>
<body>
	<div class="blank_bottom"></div>
	<div class="form-actions">
		<c:if
			test="${not empty loginedMemberVo.userid && loginedMemberVo.userid == 'admin'}">
			<!-- 레시피 수정 -->
			<form action="/cook/list/modifyCooks" method="POST">
				<input type="hidden" name="cook_no" value="${cookInfo.cook_no}">
				<input type="hidden" name="CKG_NM" value="${cookInfo.CKG_NM}" /> <input
					type="submit" class="modify-btn" value="레시피 수정">
			</form>
			<!-- 레시피 삭제 -->
			<form action="/cook/list/deleteCooks" method="POST"
				onsubmit="return confirm('레시피를 삭제하시겠습니까?');">
				<input type="hidden" name="cook_no" value="${cookInfo.cook_no}">
				<input type="hidden" name="CKG_NM" value="${cookInfo.CKG_NM}" /> <input
					type="submit" class="delete-btn" value="레시피 삭제">
			</form>
		</c:if>
	</div>
	<c:choose>
		<c:when test="${not empty cookInfo}">
			<!-- 요리 상세 정보 -->
			<div class="list center-container">
				<div class="image-text-container">
					<!-- 요리 사진 -->
					<div class="image-container">
						<img
							src="<c:url value='/libraryUploadImg/${cookInfo.CKG_IMG_URL}' />"
							width="300" height="300" alt="${cookInfo.CKG_NM}">
					</div>
					<!-- 요리 상세 정보 -->
					<div class="details">
						<div class="d-cook-name">
							<strong>${cookInfo.CKG_NM}</strong>
						</div>
						<div class="d-cook-portion">
							<strong>${cookInfo.CKG_INBUN_NM}</strong>
						</div>
						<div class="d-cook-time">
							<strong>${cookInfo.CKG_TIME_NM}</strong>
						</div>

						<!-- 북마크 버튼 추가 -->
						<div class="bookmark-container" style="margin-top: 10px;">
							<form id="bookmarkForm"
								action="${pageContext.request.contextPath}/list/bookmark"
								method="POST">
								<c:if test="${empty loginedMemberVo.userid}">
									<input type="hidden" name="userid" value="" id="userId" />
									<input type="hidden" name="CKG_NM" value="${cookInfo.CKG_NM}"
										id="CKG_NM" />
									<input type="hidden" name="cook_no" value="${cookInfo.cook_no}"
										id="cook_no" />
									<input type="hidden" name="pageURL" id="pageURL" />
									<div id="bookmarkButton"
										class="bookmark-icon ${bookmarkExists != null && bookmarkExists ? 'yellow' : 'gray'}"
										onclick="checkLoginBeforeComment()"></div>

								</c:if>
								<c:if test="${not empty loginedMemberVo.userid}">
									<input type="hidden" name="userid"
										value="${loginedMemberVo.userid}" id="userId" />
									<input type="hidden" name="CKG_NM" value="${cookInfo.CKG_NM}"
										id="CKG_NM" />
									<input type="hidden" name="cook_no" value="${cookInfo.cook_no}"
										id="cook_no" />
									<input type="hidden" name="pageURL" id="pageURL" />

									<div
										class="bookmark-icon ${bookmarkExists != null && bookmarkExists ? 'yellow' : 'gray'}"
										onclick="bookmark(event)"></div>


								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="blank_bottom"></div>

			<!-- 추가적인 정보 (재료 및 레시피) -->
			<div class="mtrl-container center-container">
				<div class="recipe-title">
					<strong>[재료]</strong>
				</div>
				<!-- 재료 정보 -->
				<div class="ingredients">
					<p>${cookInfo.CKG_MTRL_CN}</p>
				</div>
			</div>

			<div class="blank_bottom"></div>

			<div class="recipe-container center-container">
				<div class="recipe-title">
					<strong>[레시피]</strong>
				</div>
				<!-- 레시피 단계 -->
				<ol class="recipe-steps">
					<c:forEach var="step" items="${steps}">
						<li>${step}</li>
					</c:forEach>
				</ol>
			</div>

			<div class="blank_bottom"></div>

			<div class="share-container center-container">
				<div class="share-title">
					<strong>[공유하기]</strong>
				</div>
				<div class="youtubeLink">
					<img
					    src="${pageContext.request.contextPath}/resources/img/youtube.png"
					    alt="youtube" class="search-image" onclick="window.location.href = 'https://www.youtube.com/results?search_query=' + encodeURIComponent('${cookInfo.CKG_NM}')"> 
					<img
						src="${pageContext.request.contextPath}/resources/img/icon-twitter.png"
						alt="X" class="search-image" onclick="shareTwitter()" /> <img
						src="${pageContext.request.contextPath}/resources/img/icon-facebook.png"
						alt="facebook" class="search-image" onclick="shareFacebook()" /> <img
						src="${pageContext.request.contextPath}/resources/img/copy-link.png"
						alt="copy" class="search-image" onclick="clipBoard()" />
				</div>
			</div>
			<div class="blank_bottom"></div>

			<!-- 댓글 등록 폼 -->
			<div class="comment-container">
				<form id="commentForm"
					action="${pageContext.request.contextPath}/board/addComment"
					method="post" onsubmit="return validateCommentForm()"
					class="comment-form">
					<input type="hidden" name="CKG_NM" value="${cookInfo.CKG_NM}" /> <input
						type="hidden" name="cook_no" value="${cookInfo.cook_no}"
						id="cook_no" /> <input type="hidden" name="userid"
						value="${loginedMemberVo.userid}" id="userId" />
					<textarea name="content" id="content"
						onclick="return checkLoginBeforeComment(event)"
						class="comment-textarea" placeholder="댓글을 남겨주세요."
						onkeydown="preventEnter(event)"></textarea>
					<input type="submit" value="댓글 등록" class="comment-submit" />
				</form>
			</div>

			<div class="blank_bottom"></div>

			<!-- 댓글 리스트 -->
			<c:if test="${not empty boardList}">
				<div class="comment-list">
					<c:forEach var="board" items="${boardList}">
						<div class="comment-item">
							<div class="comment-header">
								<span class="comment-id">${board.userid}</span> <span
									class="comment-date">${board.write_date}</span>
							</div>

							<!-- 댓글 내용 -->
							<div class="comment-content">
								<span id="content-text-${board.content}-${board.board_no}" class="comment-text">${board.content}</span>
								<textarea name="new_content" id="content-edit-${board.content}-${board.board_no}"
									class="comment-textarea" style="display: none">${board.content}</textarea>
							</div>

							<div class="comment-actions">
								<div class="comment-buttons">
									<c:if test="${board.userid == loginedMemberVo.userid}">
										<!-- 수정 버튼 -->
										<form id="updateForm-${board.content}-${board.board_no}"
											action="/cook/board/updateComment" method="POST">
											<input type="hidden" name="board_no"
												value="${board.board_no}"> <input type="hidden"
												name="cook_no" value="${board.cook_no}"> <input
												type="hidden" name="content" value="${board.content}">
											<input type="hidden" name="userid" value="${board.userid}">
											<input type="hidden" name="CKG_NM" value="${board.CKG_NM}">
											<input type="submit" value="수정"
												id="updateButton-${board.content}-${board.board_no}"
												onclick="return editComment('${board.content}','${board.board_no}')">
										</form>
									</c:if>
									<c:if
										test="${board.userid == loginedMemberVo.userid || loginedMemberVo.userid == 'admin'}">
										<!-- 삭제 버튼 -->
										<form action="/cook/board/deleteComment" method="POST"
											onsubmit="return confirm('정말로 댓글을 삭제하시겠습니까?');">
											<input type="hidden" name="board_no"
												value="${board.board_no}"> <input type="hidden"
												name="cook_no" value="${board.cook_no}"> <input
												type="hidden" name="content" value="${board.content}">
											<input type="hidden" name="userid" value="${board.userid}">
											<input type="hidden" name="CKG_NM" value="${board.CKG_NM}">
											<input type="submit" value="삭제">
										</form>
									</c:if>
								</div>
								<c:if
									test="${board.userid != loginedMemberVo.userid && loginedMemberVo.userid != 'admin'}">
								</c:if>

								<!-- 좋아요 및 싫어요 버튼 -->
								<div class="comment-likes">
									<form action="/cook/board/likeComment" method="POST"
										onsubmit="return checkLoginBeforeComment()">
										<input type="hidden" name="board_no" value="${board.board_no}">
										<input type="hidden" name="cook_no" value="${board.cook_no}">
										<input type="hidden" name="content" value="${board.content}">
										<input type="hidden" name="userid" value="${board.userid}">
										<input type="hidden" name="CKG_NM" value="${board.CKG_NM}">
										<input type="hidden" name="liked" value="1"> <input
											type="hidden" name="like_id"
											value="${loginedMemberVo.userid}"> <input
											type="submit" value="좋아요">
									</form>
									<span class="like-count">${board.likeCount}</span>

									<form action="/cook/board/dislikeComment" method="POST">
										<input type="hidden" name="board_no" value="${board.board_no}">
										<input type="hidden" name="cook_no" value="${board.cook_no}">
										<input type="hidden" name="content" value="${board.content}">
										<input type="hidden" name="userid" value="${board.userid}">
										<input type="hidden" name="CKG_NM" value="${board.CKG_NM}">
										<input type="hidden" name="disliked" value="1"> <input
											type="hidden" name="like_id"
											value="${loginedMemberVo.userid}"> <input
											type="submit" value="싫어요"
											onclick="return checkLoginBeforeComment()">
									</form>
									<span class="dislike-count">${board.dislikeCount}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<!-- 페이지네이션 UI -->
			<div class="pagination">
				<c:if test="${currentPage > 1}">
					<a
						href="?cook_no=${cookInfo.cook_no}&cookName=${cookInfo.CKG_NM}&page=1">첫
						페이지</a>
					<a
						href="?cook_no=${cookInfo.cook_no}&cookName=${cookInfo.CKG_NM}&page=${currentPage - 1}">이전</a>
				</c:if>

				<c:forEach var="i" begin="1" end="${totalPages}">
					<c:if test="${i == currentPage}">
						<span class="current">${i}</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a
							href="?cook_no=${cookInfo.cook_no}&cookName=${cookInfo.CKG_NM}&page=${i}">${i}</a>
					</c:if>
				</c:forEach>

				<c:if test="${currentPage < totalPages}">
					<a
						href="?cook_no=${cookInfo.cook_no}&cookName=${cookInfo.CKG_NM}&page=${currentPage + 1}">다음</a>
					<a
						href="?cook_no=${cookInfo.cook_no}&cookName=${cookInfo.CKG_NM}&page=${totalPages}">마지막
						페이지</a>
				</c:if>
			</div>

			<c:if test="${empty boardList}">
				<h1 style="text-align: center;">작성된 댓글이 없습니다.</h1>
				<div class="blank_bottom"></div>
			</c:if>
		</c:when>
		<c:otherwise>
			<p>해당 요리 정보를 찾을 수 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<%@ include file="../footer.jsp"%>
</body>
</html>
