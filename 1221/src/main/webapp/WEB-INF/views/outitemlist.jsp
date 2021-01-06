<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>outitemlist</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function fncOutDetail(outitemlistcd){
		var check = 'T'
		var listitemcd = document.getElementById('itemcd'+outitemlistcd).innerText;
		var listitemname = document.getElementById('itemname'+outitemlistcd).innerText;
		var listmadename = document.getElementById('madename'+outitemlistcd).innerText;
		var listdelivamt = document.getElementById('delivamt'+outitemlistcd).innerText;
		var listid = document.getElementById('id'+outitemlistcd).innerText;
		var listname = document.getElementById('name'+outitemlistcd).innerText;
		var listrelname = document.getElementById('relname'+outitemlistcd).innerText;
		var listitemunit = document.getElementById('itemunit'+outitemlistcd).innerText;
		var listaddrcd = document.getElementById('addrcd'+outitemlistcd).innerText;
		var listaddrname = document.getElementById('addrname'+outitemlistcd).innerText;
		var listmobiletelno = document.getElementById('mobiletelno'+outitemlistcd).innerText;
		var listhometelno = document.getElementById('hometelno'+outitemlistcd).innerText;
		var listcheckyn = document.getElementById('checkyn'+outitemlistcd).innerText;
		var listdelivyn = document.getElementById('delivyn'+outitemlistcd).innerText;
		var listdelivcorpcd = document.getElementById('delivcorpcd'+outitemlistcd).value;
		var listdelivcor = document.getElementById('delivcor'+outitemlistcd).value;
		var listdelivno = document.getElementById('delivno'+outitemlistcd).value;
		var listuserinfodetailcd = document.getElementById('userinfodetailcd'+outitemlistcd).value;
		document.getElementById('check').value=check;
		console.log(listdelivyn);
		
		if(document.getElementById('check').value=='T'){
			document.getElementById('itemcd').value = listitemcd;
			document.getElementById('itemname').value = listitemname;
			document.getElementById('madename').value = listmadename;
			document.getElementById('itemunit').value=listitemunit;
			document.getElementById('delivamt').value = listdelivamt;
			document.getElementById('id').value = listid;
			document.getElementById('name').value = listname;
			document.getElementById('relname').value = listrelname;
			document.getElementById('addrcd').value = listaddrcd;
			document.getElementById('addrname').value = listaddrname;
			document.getElementById('mobiletelno').value = listmobiletelno;
			document.getElementById('hometelno').value = listhometelno;
			document.getElementById('checkyn').value = listcheckyn;
			document.getElementById('delivno').value = listdelivno;
			document.getElementById('userinfodetailcd').value =listuserinfodetailcd;

			document.getElementById('delivcor').value = listdelivcorpcd
			
			if(listdelivyn == 'Y'){
				document.getElementById('delivyn').checked = true;
			}else{//'N'
				document.getElementById('delivyn').checked = false;
			}
			
			if(listdelivyn == 'N'){
				document.getElementById('checkyn').disabled = false;
				document.getElementById('delivyn').disabled = false;
				document.getElementById('delivcor').disabled = false;
				document.getElementById('delivno').disabled = false;
			}
		}
	}

	$(function(){
		$('#saveBtn').click(function(){
			
			if($('#check').val()==''){
				alert('table에 하나의 행을 선택해 주세요');
			}else{
				var delivyn = '';
				if($('#delivyn').is("checked") == true){
					delivyn ='Y';
				}else{
					delivyn ='N';
				}
				
				$.ajax({
					url:'itemlistUpdate',
					type:'post',
					async:false,
					data:{
						 itemcd : $('#itemcd').val(),
						 delivamt : $('#delivamt').val()
					},
					success:function(data){
						if(data.code == true){
							alert('itemlist update 성공');
						}else{
							alert('itemlist update 실패');
						}
					}
				});
			}
		});
	});

</script>
</head>
<body>
	<h1>금일출고리스트</h1>
	<br><br>
	
	<table border="1">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>제조사코드</th>
			<th>제조사명</th>
			<th>단위명</th>
			<th>출고수량</th>
			<th>회원아이디</th>
			<th>이름</th>
			<th>관계</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>휴대전화</th>
			<th>집전화</th>
			<th>검수여부</th>
			<th>배송여부</th>
		</tr>
		<c:forEach items="${list }" var="list">
			<tr onclick="fncOutDetail('${list.outitemlistcd}')">
				<td id="itemcd${list.outitemlistcd }">${list.itemcd }</td>
				<td id="itemname${list.outitemlistcd }">${list.itemname }</td>
				<td id="madenmcd${list.outitemlistcd }">${list.madenmcd }</td>
				<td id="madename${list.outitemlistcd }">${list.madename }</td>
				<td id="itemunit${list.outitemlistcd }">${list.itemunit }</td>
				<td id="delivamt${list.outitemlistcd }">${list.delivamt }</td>
				<td id="id${list.outitemlistcd }">${list.id }</td>
				<td id="name${list.outitemlistcd }">${list.name }</td>
				<td id="relname${list.outitemlistcd }">${list.relname }</td>
				<td id="addrcd${list.outitemlistcd }">${list.addrcd }</td>
				<td id="addrname${list.outitemlistcd }">${list.addrname }</td>
				<td id="mobiletelno${list.outitemlistcd }">${list.mobiletelno }</td>
				<td id="hometelno${list.outitemlistcd }">${list.hometelno }</td>
				<td id="checkyn${list.outitemlistcd }">${list.checkyn }</td>
				<td id="delivyn${list.outitemlistcd }">${list.delivyn }
					<input type="hidden" id="delivcorpcd${list.outitemlistcd }" value="${list.delivcorpcd }">
					<input type="hidden" id="delivcor${list.outitemlistcd }" value="${list.delivcor }">
					<input type="hidden" id="delivno${list.outitemlistcd }" value="${list.delivno }"> 
					<input type="hidden" id="userinfodetailcd${list.outitemlistcd }" value="${list.userinfodetailcd }">
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<hr>
	<div class="content">
		<input type="button" name="saveBtn" id="saveBtn" value="저장"><br>
		상품코드 : <input type="text" name="itemcd" id="itemcd" disabled="disabled">
		상품명 :  <input type="text" name="itemname" id="itemname" disabled="disabled">
		제조사 : <input type="text" name="madename" id="madename" disabled="disabled"><br>
		단위 : <input type="text" name="itemunit" id="itemunit" disabled="disabled">
		출고수량 : <input type="text" name="delivamt" id="delivamt" disabled="disabled"><br>
		회원아이디 : <input type="text" name="id" id="id" disabled="disabled">
		회원이름 : <input type="text" name="name" id="name" disabled="disabled">
		관계 : <input type="text" name="relname" id="relname" disabled="disabled"><br>
		우편번호 : <input type="text" name="addrcd" id="addrcd" disabled="disabled">
		주소 : <input type="text" name="addrname" id="addrname" disabled="disabled">
		휴대전화 : <input type="text" name="mobiletelno" id="mobiletelno" disabled="disabled"><br>
		집전화 : <input type="text" name="hometelno" id="hometelno" disabled="disabled">
		검수여부 : <input type="text" name="checkyn" id="checkyn" disabled="disabled">
		배송여부 : <input type="checkbox" name="delivyn" id="delivyn"disabled="disabled"><br>
		배송회사 : <select id="delivcor" disabled="disabled">
					<option value="default">선택</option>
					<option value="C0081">CJ대한통운</option>
					<option value="C0082">우체국택배</option>
					<option value="C0181">대한통운</option>
					<option value="C0182">로젠택배</option>
					<option value="C0184">SKSMSK</option>
					<option value="C0185">총알택배</option>
					<option value="C0186">경동택배<option>
				</select>
		송장번호 : <input type="text" name="delivno" id="delivno" disabled="disabled">
		check : <input type="text" name="check" id="check" disabled = "disabled">
		<input type="hidden" id="userinfodetailcd"> 
	</div>
	

</body>
</html>