<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td><input type="text" name="user_id" id="user_id" value="${map.user_id }" readonly="readonly"/></td>
					<th scope="row">이름</th>
					<td><input type="text" name="user_nm" id="user_nm" value="${map.user_nm }" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	<%@ include file="/WEB-INF/include/include-body.jsp"%>
	<script type="text/javascript"> 
	
		$(document).ready(function() {
		    $("#list").on("click", function(e) { //목록으로 버튼 
		        e.preventDefault();
		        fn_openBoardList();
		    });
		    $("#update").on("click", function(e) {
		        e.preventDefault();
		        fn_updateBoard();
		    });
		    $("#delete").on("click", function(e) {
		        e.preventDefault();
		        fn_deleteBoard();
		    });
		});
	
		function fn_openBoardList() {
		    var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
		    comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			console.log(comSubmit);
			comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
			comSubmit.submit();
			
		}

	</script>
</body>
</html>

