<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
	<h2>게시판 목록</h2>
	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="10%" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">사용자ID</th>
				<th scope="col">사용자명</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td align="center">
								<a href="#this" name="title">${row.user_id }</a>
								<input type="hidden" id="user_id" value="${row.user_id }">
							</td>
							<td align="center">${row.user_nm }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<a href="#this" class="btn" id="write">작성하기</a>
	
	
	<%@ include file="/WEB-INF/include/include-body.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e){  //작성하기 버튼 
				e.preventDefault(); 
				fn_openBoardWrite(); 
			});
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});

		});
		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
			comSubmit.addParam("user_id", obj.parent().find("#user_id").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>
