<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD REGISTER</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var board = $("#board");
		var btnRegister = $("#btnRegister");
		var btnList = $("#btnList");

		btnRegister.on("click", function() {
			if ($("#title").val() == null || $("#title").val() == "") {
				alert("제목을 입력해주세요");
				return false;
			}

			// 등록 / 수정인지에 따라 이동 경로를 달리한다.
			if ($("#btnRegister").text() == "수정") {
				board.attr("action", "/board/modify");
			}
			board.submit();
		});
		btnList.on("click", function() {
			location.href = "/board/list";
		});
	});
</script>
<body>
	<h2>REGISTER</h2>
	<hr />
	<br />
	<form:form action="/board/register" method="post"
		modelAttribute="board">
		<c:if test="${status eq 'u' }">
			<input type="hidden" name="boNo" value="${board.boNo }">
		</c:if>
		<table border="1">

			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"  value="${board.title }"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" id=writer value="${board.writer }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="30" name="content" >${board.content }</textarea></td>
			</tr>
			
		</table>
		<c:set value="등록 " var="btnText" />
		<c:if test="${status eq 'u' }">
			<c:set value="수정" var="btnText" />
		</c:if>
		<div>
			<button type="submit" id="btnRegister">${btnText }</button>
			<button type="button" id="btnList">목록</button>
		</div>
	</form:form>
</body>
</html>