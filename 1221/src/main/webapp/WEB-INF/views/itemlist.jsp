<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>itemlist와 initemlist</title>
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
					
					$('#itemlisttable').empty();
					$('#itemlisttable').append(
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
						
						$('#itemlisttable').append(
							'<tr onclick="fncGoDetail(\''+getlist[i]['itemcd']+'\')">'  
								+'<td id = "itemcd' + getlist[i]['itemcd'] + '">' + getlist[i]['itemcd'] +  '</td>' 
								+'<td id = "itemname' + getlist[i]['itemcd'] + '">'+ getlist[i]['itemname'] + '</td>'
								+'<td id = "madenmcd' + getlist[i]['itemcd'] + '">'+ getlist[i]['madenmcd'] + '</td>'
								+'<td id = "madename' + getlist[i]['itemcd'] + '">'+ getlist[i]['madename'] + '</td>'
								+'<td id = "itemunitcd' + getlist[i]['itemcd'] + '">'+ getlist[i]['itemunitcd'] + '</td>'
								+'<td id = "itemunit' + getlist[i]['itemcd'] + '">'+ getlist[i]['itemunit'] + '</td>'
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
		 
		$('#uptBtn').click(function(){
			if($('#insCheck').val()==''){
				/* console.log('전체리스트'); */
				var  upcd= $('#categoryselect').val();
				var  itemclscd= $('#classifyselect').val();
				if(upcd != 'default' && itemclscd != 'default' && searchBtnCheck != false){
					buttonClick = 'itemupt';//고민해보기!!! 굳이??
					$('#insamt').attr('disabled',false);
				}else{
					alert('카테고리와 1차분류값을 선택 후 조회버튼을 누르시오');
				}
			}else{
				/* console.log(document.getElementById('insCheck').value); */
				/* console.log('금일입고리스트'); */
				$('#insamt').attr('disabled',false);
			}

		});//uptBtn
	
		$('#codeFrm').submit(function(e){
			e.preventDefault();
			
			var checked = false;
			var secondChecked = false;
			if($('#insCheck').val()==''){
				$.ajax({
					url:"initeminsert",
					type:"post",
					async: false,
					data:{
						itemcd : $('#itemcd2').val(),
						insamt : $('#insamt').val()
					},
					success:function(data){
						if(data.code==true){
							alert('insert 성공');
							checked = true;
						}else{
							alert('insert 실패');
							checked = false;
						}
					}
				});//insert ajax 
				
				if(checked == true){
					$.ajax({
						url:"insamtplus",
						type:'post',
						async: false,
						data:{
							itemcd : $('#itemcd2').val(),
							stockamt : $('#insamt').val()
						},
						success:function(data){
							if(data.code == true){
								alert('update 성공');
							}else{
								alert('update 실패');
							}
						}
					});//update ajax
				}else{
					alert('2중 ajax 실패');
				}
			}else{
				//여기서는 금일 입고리스트 값을 바꿔주기!!
				
				$.ajax({
						url:"totalupdate",
						type:'post',
						async: false,
						data:{
							itemcd : $('#itemcd2').val(),
							insamt: $('#insamt').val(),
							beforeinsamt : $('#beforeinsamt').val()
						},
						success:function(data){
							if(data.code == true){
								secondChecked = true;
								alert('전체list 업로드성공');
							}else{
								secondChecked = false;
								alert('전체list 업로드실패');
							}
						}
					});//totalupdate ajax
				
				if(secondChecked == true){
					$.ajax({
						url:"insupdate",
						type:'post',
						async: false,
						data:{
							itemcd : $('#itemcd2').val(),
							insamt : $('#insamt').val(),
							insitemlistcd : $('#insitemlistcd').val()
						},
						success:function(data){
							if(data.code == true){
								alert('금입 입고list 업로드성공');
							}else{
								alert('금입 입고list 업로드실패');
							}
						}
					});//insupdate ajax
				}
				
			}
			
		});//codeFrm
	});//jquery 시작
	 
 		function fncGoDetail(itemcd){
 		 /* update하려고 할 떄 값을 뿌려주기 */
 			var listitemcd = document.getElementById('itemcd'+itemcd).innerText;
 			var listitemname = document.getElementById('itemname'+itemcd).innerText;
 			var listmadename = document.getElementById('madename'+itemcd).innerText;
 			var listitemunit = document.getElementById('itemunit'+itemcd).innerText;
 			
 			document.getElementById('itemcd2').value = listitemcd;
 			document.getElementById('itemname2').value = listitemname;
 			document.getElementById('madename').value = listmadename;
 			document.getElementById('itemunit').value = listitemunit;
 		} 
	
		function fncTodayDetail(insitemlistcd){
			var check = 'T';
			var listitemcd = document.getElementById('itemcd'+insitemlistcd).innerText;
			var listitemname = document.getElementById('itemname'+insitemlistcd).innerText;
			var listmadename = document.getElementById('madename'+insitemlistcd).innerText;
			var listitemunit = document.getElementById('itemunit'+insitemlistcd).innerText;
			var listinsamt = document.getElementById('insamt'+insitemlistcd).innerText;
			var listinsitemlistcd = document.getElementById('insitemlistcd'+insitemlistcd).innerText;
			
			document.getElementById('itemcd2').value = listitemcd;
			document.getElementById('itemname2').value = listitemname;
			document.getElementById('madename').value = listmadename;
			document.getElementById('itemunit').value = listitemunit;
			document.getElementById('insamt').value = listinsamt;
			document.getElementById('beforeinsamt').value = listinsamt;
			document.getElementById('insitemlistcd').value = listinsitemlistcd;
			document.getElementById('insCheck').value = check;
			
			console.log(document.getElementById('beforeinsamt').value);
			/* 값이 담기는 것 확인 */
		}
	
		
</script>
<style type="text/css">
	#report:hover tbody tr:hover td{
		background: blue;
		color:white;
	}
</style>
</head>
<body>
	<h1>전체리스트</h1>
	<div>
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
	<table border="1" id="itemlisttable" class=table id="report">
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
	<div>
		<h1>금일 입고리스트</h1>
		<table border="1" id="initemlisttable" class="table">
			<tr>
				<th>상품코드</th>
				<th>입고코드</th>
				<th>상품명</th>
				<th>제조사코드</th>
				<th>제조사명</th>
				<th>단위코드</th>
				<th>단위명</th>
				<th>입고수량</th>
			</tr>
			 <c:forEach items="${todayinslist }" var="list"> 
				<tr onclick="fncTodayDetail('${list.insitemlistcd}')">
					<td id="itemcd${list.insitemlistcd }">${list.itemcd}</td>
					<td id="insitemlistcd${list.insitemlistcd }">${list.insitemlistcd }</td>
					<td id="itemname${list.insitemlistcd }">${list.itemname}</td>
					<td>${list.madenmcd }</td>
					<td id="madename${list.insitemlistcd }">${list.madename }</td>
					<td>${list.itemunitcd }</td>
					<td id="itemunit${list.insitemlistcd }">${list.itemunit }</td>
					<td id="insamt${list.insitemlistcd }">${list.insamt }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<hr>
	<div>
		<form name="codeFrm" id="codeFrm" >
		<h4>입고내용</h4>
			상품코드  :  <input type="text" name="itemcd" id="itemcd2" disabled="disabled" ><br>
			상품명  :	 <input type="text" name="itemname2" id="itemname2" disabled="disabled"><br>
			제조사 : <input type="text" name="madename" id="madename" disabled="disabled">&nbsp;&nbsp;&nbsp;&nbsp;
			단위명 : <input type="text" name="itemunit" id="itemunit" disabled="disabled"><br>
			입고수량 :  <input type="text" name="insamt" id="insamt" disabled="disabled">
			<h6>나중에  insCheck와 beforeinsamt는 hidden처리해둘것!!</h6>
			insCheck : <input type="text" name="insCheck" id="insCheck">
			<!-- 여기에 들어가는 값은, 입고리스트를 눌렀을 때와, 전체리스트를 눌렀을 때를 구별하기 위해서 -->
			beforeinsamt : <input type="text" name="beforeinsamt" id="beforeinsamt"><br>
			<!-- 입고수량(before)을 미리 담아두기 위해서 -->
			insitemlistcd : <input type="text" name="initemlistcd" id="insitemlistcd"><br>
			    
			&nbsp;&nbsp;<input type="button" name="uptBtn" id="uptBtn" value="수정"> &nbsp;&nbsp;
			&nbsp;&nbsp;<input type="submit" name="saveBtn" id="saveBtn" value="저장"> &nbsp;&nbsp;
		</form>
	</div>
</body>
</html>