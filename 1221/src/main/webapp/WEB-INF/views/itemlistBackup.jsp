<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>itemlist_bakcup</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	 //document.ready 안 됨
	 //if document on?
 	$(function(){
 		var searchBtnCheck = false;
		$('#searchBtn').click(function(){
			searchBtnCheck = true;
			
			$.ajax({
				url:'getlist',
				type:'get',
				data:{
					madenmcd : $('#categoryselect').val(), 
					itemclscd : $('#classifyselect').val()
				},
				success:function(data){
					var getlist = data.getlist;
					
					$('#table').empty();
					$('#table').append(
							'<tr>'
								+'<th>상품코드</th>'
								+'<th>상품명</th>'
								+'<th>제조사코드</th>'
								+'<th>제조사명</th>'
								+'<th>단위코드</th>'
								+'<th>단위명</th>'
								+'<th>재고수량</th>'
								+'<th>재고여부</th>'
								+'<th>사용여부</th>'
							+'</tr>'
					);
				  for(var i=0; i<getlist.length;i++){
						var stockyn = '';
						var useyn = '';
						
						if(getlist[i]['stockyn'] == 'Y'){
							stockyn = '<input type="checkbox" id="stockyn'+getlist[i]['itemcd']+'" checked="checked">';
						}else{
							stockyn = '<input type="checkbox" id="stockyn'+getlist[i]['itemcd']+'">';
						}
						
						if(getlist[i]['useyn'] == 'Y'){
							useyn = '<input type="checkbox" id="useyn'+getlist[i]['itemcd']+'" checked="checked">';
						}else{
							useyn = '<input type="checkbox" id="useyn'+getlist[i]['itemcd']+'">';
						}
						
						$('#table').append(
							'<tr onclick="fncGoDetail(\''+getlist[i]['itemcd']+'\')">'  
								+'<td id = "itemcd' + getlist[i]['itemcd'] + '">' + getlist[i]['itemcd'] +  '</td>' 
								+'<td id = "itemname' + getlist[i]['itemcd'] + '">'+ getlist[i]['itemname'] + '</td>'
								+'<td id = "madenmcd' + getlist[i]['itemcd'] + '">'+ getlist[i]['madenmcd'] + '</td>'
								+'<td>' + getlist[i]['madename'] + '</td>'
								+'<td id = "itemunitcd' + getlist[i]['itemcd'] + '">'+ getlist[i]['itemunitcd'] + '</td>'
								+'<td>' + getlist[i]['itemunit'] + '</td>'
								+'<td>'+ getlist[i]['stockamt'] + '</td>'
								+'<td>' + stockyn + '</td>'
								+'<td>' + useyn+ '</td>'
							+'</tr>'
						); // append
					}//for문
				}//success
			});//ajax  
	 	 });//조회버튼 
			
		 $('#categoryselect').change(function(){
			$.ajax({
				url:'category',
				type:'post',
				data:{
					upcd : $('#categoryselect').val()				
				},
				success:function(data){
					var list = data.categorylist;
					
					$('#classifyselect').empty();
					for(var i=0;i<list.length;i++){
						$('#classifyselect').append('<option value='+list[i]['cdno']+'>'+list[i]['cdname']+'</option>');
					}//for문
				}//success
			}); //ajax
		});//change
		
		var buttonClick='';
		$('#addBtn').click(function(){
			var  upcd= $('#categoryselect').val();
			var  itemclscd= $('#classifyselect').val();
			
			if( upcd != 'default' && itemclscd != 'default' && searchBtnCheck != false ) {
				buttonClick = 'itemadd';
				//document.getElementById('itemname2').disabled = false;
				//document.getElementById('madenmcd').disabled = false;
				//document.getElementById('itemunitcd').disabled = false;
				//document.getElementById('useyn').disabled = false;
				$('#itemname2').attr('disabled',false);
				$('#madenmcd').attr('disabled',false);
				$('#itemunitcd').attr('disabled',false);
				$('#useyn').attr('disabled',false);
				$('#uptBtn').hide();
				
				$.ajax({
					url:'newitemcd',
					type:'get',
					success:function(data){
						console.log(data.newitemcd);
						$('#itemcd2').val(data.newitemcd);
					}//success
				});//ajax
			}else{
				alert('카테고리와 1차분류값을 선택 후 조회버튼을 누르시오');
			}
			
		});//addbtn
		 
		$('#uptBtn').click(function(){
			buttonClick = 'itemupt';
			//document.getElementById('itemname2').disabled=false;
			$('#itemname2').attr('disabled',false);
			$('#madenmcd').attr('disabled',false);
			$('#itemunitcd').attr('disabled',false);
			$('#useyn').attr('disabled',false);
			$('#addBtn').hide();
		});//uptBtn
	
		$('#codeFrm').submit(function(e){
			e.preventDefault();
			
			if(buttonClick != ''){
				var useyn = '';
				if(document.getElementById('useyn').checked){
					useyn = 'Y';
				}else{
					useyn = 'N';
				}
			}
			
			$.ajax({
				url:buttonClick+"code",
				type:'post',
				data:{
					itemcd : $('#itemcd2').val(),
					itemname: $('#itemname2').val(),
					madenmcd:$('#madenmcd').val(),
					itemunitcd : $('#itemunitcd').val(),
					useyn : useyn,
					itemclscd : $('#classifyselect').val()
				},
				success:function(data){
					if(data.code == true){
						alert('성공');
					}else{
						alert('실패');
					}
				location.reload();
				}
			});//ajax
		});//codeFrm
	});//jquery 시작
	 
 		function fncGoDetail(itemcd){
 		 /* update하려고 할 떄 값을 뿌려주기 */
 		 console.log('탄다');
 			var listitemcd = document.getElementById('itemcd'+itemcd).innerText;
 			var listitemname = document.getElementById('itemname'+itemcd).innerText;
 			var listmadenmcd = document.getElementById('madenmcd'+itemcd).innerText;
 			var listitemunitcd = document.getElementById('itemunitcd'+itemcd).innerText;
 			var listuseyn = document.getElementById('useyn'+itemcd).checked;
 			
 			document.getElementById('itemcd2').value = listitemcd;
 			document.getElementById('itemname2').value = listitemname;
 			document.getElementById('madenmcd').value = listmadenmcd;
 			document.getElementById('itemunitcd').value = listitemunitcd;
 			document.getElementById('useyn').checked = listuseyn;
 		} 
</script>
<style type="text/css">
	.report:hover tbody tr:hover td{
		background: blue;
		color:white;
	}
</style>
</head>
<body>
	<div>
		<h1>전체리스트</h1>
		카테고리 : 
				<select id="categoryselect"> <!-- onchange="categoryChange(this)" -->
					<option value="default">카테고리를 선택하시오</option>
					<option value="C0002">청소용품</option>
					<option value="C0003">주방용품</option>
					<option value="C0004">사무용품</option>
					<option value="C0006">소모품</option>
					<option value="C0007">가구용품</option>
					<option value="C0009">가전제품</option>
					<option value="C0010">의류제품</option>
				</select>
				&nbsp;&nbsp;
		1차분류 : <select id="classifyselect">
					<option value="default">값을 선택하시오</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="searchBtn" id="searchBtn" value="조회"> <br><br>
	</div>
	<!-- 여기에 값 하나 빠짐 다시 확인해서 넣을것!! -->
	<table border="1" id="table" class="report">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>제조사코드</th>
			<th>제조사명</th>
			<th>단위코드</th>
			<th>단위명</th>
			<th>재고수량</th>
			<th>재고여부</th>
			<th>사용여부</th>
		</tr>
		<!-- "개" 틀림 -->
		<%-- <c:forEach items="${list }" var="list"> --%>
			<tr>
				<td>${list.itemcd }</td>
				<td>${list.itemname }</td>
				<td>${list.madenmcd }</td>
				<td>${list.itemclscd }</td>
				<td>${list.itemunitcd }</td>
				<td></td>
				<td>${list.stockamt }</td>
				<td>
					<c:if test="${list.stockyn == 'Y'}">
						<input type="checkbox" id="stockyn${list.itemcd }" checked="checked"> 
					</c:if>
					<c:if test="${list.stockyn == 'N'}">
						<input type="checkbox" id="stockyn${list.itemcd }"> 
					</c:if>
				</td>
				<td>
					<c:if test="${list.useyn == 'Y'}">
						<input type="checkbox" id="useyn${list.itemcd }" checked="checked"> 
					</c:if>
					<c:if test="${list.useyn == 'N'}">
						<input type="checkbox" id="useyn${list.itemcd }"> 
					</c:if>
				</td>
			</tr>
		<%-- </c:forEach> --%>
	</table>
	<hr>
	<div>
		<form name="codeFrm" id="codeFrm">
			상품코드  :  <input type="text" name="itemcd2" id="itemcd2" disabled="disabled" ><br>
			상품명  :	 <input type="text" name="itemname2" id="itemname2" disabled="disabled"><br>
			제조사 : <select id="madenmcd" name="madenmcd" disabled="disabled">
						<option value="C0056">잡화제조사</option>
						<option value="C0055">문구제조사</option>
						<option value="C0054">가구제조사</option>
				  </select>&nbsp;&nbsp;&nbsp;&nbsp;
			단위명 : <select id="itemunitcd" name="itemunitcd" disabled="disabled">
						<option value="C0061">개</option>
						<!-- 개인 -->
						<!-- <option value="C0062">켤레</option> -->
						<!-- 회사 -->
						<option value="C0062">벌</option>
				   </select><br>
				   <!-- 회사 -->
				   <!-- <input type="hidden" id="itemclscd" name="itemclscd" value="C0317"> --> <!-- 고무장갑 -->
				   <!-- 집 -->
				   <!-- <input type="hidden" id="itemclscd" name="itemclscd" value="C0228"> 고무장갑 -->
			사용여부 : <input type="checkbox" id="useyn" name="useyn" disabled="disabled">사용<br><br>
			&nbsp;&nbsp;<input type="button" name="addBtn" id="addBtn" value="추가"> &nbsp;&nbsp;
			&nbsp;&nbsp;<input type="button" name="uptBtn" id="uptBtn" value="수정"> &nbsp;&nbsp;
			&nbsp;&nbsp;<input type="submit" name="saveBtn" id="saveBtn" value="저장"> &nbsp;&nbsp;
		</form>
	</div>
</body>
</html>