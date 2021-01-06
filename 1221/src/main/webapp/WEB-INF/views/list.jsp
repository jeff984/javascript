<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>list</title>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<style type="text/css">
	#wrBtn{
		width: 70px;
		height: 70px;
	}
	#delBtn{
		width: 70px;
		height: 70px;
	}
	#srBtn{
		width: 50px;
		height: 25px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		var searchTxt = '${searchMap.searchTxt}';
		var searchType = '${searchMap.searchType}';
		var stDate = '${searchMap.stDate}';
		var endDate = '${searchMap.endDate}';
		
		$("#searchType option[value="+searchType+"]").prop("selected", true);		
		$('#searchTxt').val(searchTxt);
		$('#stDate').val(stDate);
		$('#endDate').val(endDate);
		
		$('#wrBtn').click(function(){
			location.href="boardinsertf";
		})	
		
		$('#delBtn').click(function(){
			$('#listFrm').attr("action","boarddelete").attr("method","post").submit();
			//삭제기능 ( 다수 선택 가능)
			//function fncGoDelete(){
				//var frm = document.listFrm;
				//frm.action="boarddelete";
				//frm.method = "post";
				//frm.submit();
			//}
		})
		
		$('#srbtn').click(function(){
			$('#searchFrm').attr("action","list").attr("method","post").submit();
		})
		
	})

</script>
</head>
<body>
	<h1>boardList</h1><br><br>
	
	<form name="searchFrm" id="searchFrm">
	선택 :<select name="searchType" id = "searchType">
			<option> 선 택</option>
			<option value="name" id="searName">글쓴이</option>
			<option value="subject" id="searSub">제목</option>
			<option value = "subCont" id="searSubcont">제목 + 내용</option>
		</select>
		<input name = "searchTxt" id="searchTxt" >
		<input type=button value="검색" id=srbtn ><br><br>
	
		 Date: <input type="date" name="stDate" id="stDate" />  ~
		<input type="date" name="endDate"  id="endDate" /> <br><br>
	</form>
	
	<form name="listFrm" id="listFrm">
		<input type=button value="글작성" id="wrBtn">
		<input type=button value="글삭제" id="delBtn">
		<table border="1">
			<tr>
				<th>삭제</th>
				<th>글번호</th>
				<th>작성자(id)</th>
				<th>제목</th>
				<th>작성일</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list }" var="list" varStatus="num">
				<tr>
					<td><input type = "checkbox" name = "chk" id = "chk${num.index}" value = "${list.seq }"></td>					<td>${list.seq }</td>
					<td>${list.memName }(${list.memId })</td>
					<td><a href="boardupdatef?seq=${list.seq}">${list.boardSubject }</a></td>
					<td>${list.regDate }</td>
					<td>${list.uptDate }</td>
					<td>${list.viewCnt }</td>
				</tr>	
			</c:forEach>	
		</table>
	</form>
	<div>
		<c:if test="${searchMap.startPage!= 1 }">
			<a href="list?pageNo=1&listSize=10"><<</a>
			<a href="list?pageNo=${searchMap.startPage-1 }&listSize=10"><</a>
		</c:if>
		<c:forEach begin="${searchMap.startPage }" end="${searchMap.endPage }" var = "i">
				<a href = "list?pageNo=${i}&listSize=10">${i}</a>	
		</c:forEach>
		<c:if test="${searchMap.endPage!= searchMap.total }">
			<a href = "list?pageNo=${searchMap.endPage+1 }&listSize=10"> > </a>
			<a href="list?pageNo=${searchMap.total }&listSize=10">>></a>
		</c:if>
	</div>

</body>
</html>