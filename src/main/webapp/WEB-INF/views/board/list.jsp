<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST</title>
</head>
<body>
	<a href="/board/register">등록</a>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td>게시글이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="board">
					<tr>
						<td>${board.boNo }</td>
						<td>
						<a href="/board/read?boNo=${board.boNo}">
								${board.title }</a></td>
						<td>${board.writer }</td>
						<td>${board.regDate }</td>
						<td>${board.hit }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div>
		<form action="/board/search" method = "post">
		<select name="searchType">
			<option value="boWriter" <c:if test= "${type eq 'boWriter'}">selected</c:if>>제목</option>
			<option value="boTitle" <c:if test= "${type eq 'boTitle'}">selected</c:if>>작성자</option>
			<option value="both" <c:if test= "${type eq 'both'}">selected</c:if>>제목 + 작성자</option>
		</select> 
		<input type="text" name="searchWord"> 
		<input type="submit" value="검색">
		</form>  	
	</div>
</body>
</html>