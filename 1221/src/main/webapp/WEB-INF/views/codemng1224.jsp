<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>codemng</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	  function fncGoDetail(cdno){
		
		var listcdno = document.getElementById('cdno'+cdno).innerText;
		var listcdlvl = document.getElementById('cdlvl'+cdno).innerText;
		var listupcd = document.getElementById('upcd'+cdno).innerText;
		var listcdname = document.getElementById('cdname'+cdno).innerText;
		var listuseyn = document.getElementById('useyn'+cdno).checked;
		
		console.log(listcdno);
		document.getElementById('cdno').value = listcdno;
		document.getElementById('cdlvl').value = listcdlvl;
		document.getElementById('upcd').value = listupcd;
		document.getElementById('cdname').value = listcdname;
		document.getElementById('useyn').checked = listuseyn;
	}   

	 $(function(){
		 var buttonClick = '';
		$('#addBtn').click(function(){
			buttonClick = 'add';
			document.getElementById('cdlvl').disabled = false;
			document.getElementById('upcd').disabled = false;
			document.getElementById('cdname').disabled = false;
			document.getElementById('useyn').disabled = false;
			
			$.ajax({
				url:"newcode",
				type:"get",
				success:function(data){
					document.getElementById('cdno').value = data.newcode;
				}
			});
		});
		
		$('#uptBtn').click(function(){
			buttonClick="upt";
			document.getElementById('cdlvl').disabled = false;
			document.getElementById('upcd').disabled = false;
			document.getElementById('cdname').disabled = false;
			document.getElementById('useyn').disabled = false;
		})
		
		$('#codeFrm').submit(function(e){
			e.preventDefault();
// 			if(buttonClick=="add"){
// 				$.ajax({
// 					url
// 				})
// 			}else if(buttonClick=="upt"){
				
// 			}
			if(buttonClick != ''){
				var useyn = '';
				if(document.getElementById('useyn').checked){
					useyn = 'Y'
				}else{
					useyn = 'N'
				}
				
				$.ajax({
					url: buttonClick+"code",
					type: "post",
					data:{
						cdno: $('#cdno').val(),
						cdlvl: $('#cdlvl').val(),
						upcd: $('#upcd').val(),
						cdname: $('#cdname').val(),
						useyn: useyn,
					},
					success: function(data){
						if(data.code == true){
							alert('����');
						}else{
							alert('����');
						}
					location.reload();
					}
				});
			}
		});
	 });
			
			
</script>
<style type="text/css">
	 #report1:hover tbody tr:hover td{
		background:blue;
		color:white;
	} 
</style>
</head>
<body>
	<h1>��ü����Ʈ</h1>
	<table border="1" class=table id="report1">
		<tr>
			<td>�ڵ��ȣ</td>
			<td>�ڵ巹��</td>
			<td>�����ڵ�</td>
			<td>�ڵ��̸�</td>
			<td>��뿩��</td>
		</tr>
		
		<c:forEach items="${list}" var="list">
			<tr onclick="fncGoDetail('${list.cdno}')">
				<td id="cdno${list.cdno }">${list.cdno }</td>  
				<td id="cdlvl${list.cdno }">${list.cdlvl }</td>
				<td id="upcd${list.cdno }">${list.upcd }</td>
				<td id="cdname${list.cdno }">${list.cdname }</td>
				<td>
					<c:if test="${list.useyn == 'Y' }">
						<input type="checkbox" id="useyn${list.cdno }" checked="checked">
					</c:if>
					<c:if test="${list.useyn == 'N' }">
						<input type="checkbox" id="useyn${list.cdno }">
					</c:if>
					
				</td>		
			</tr>
		</c:forEach>
	</table>

	<hr>
	<h1>�ڵ峻��</h1>
	<form name="codeFrm" id="codeFrm">
		�ڵ��ȣ : <input type="text" id="cdno" name="cdno" disabled="disabled"><br>
		�ڵ巹�� : <input type="text" id="cdlvl" name="cdlvl" disabled="disabled"><br>
		�����ڵ� : <input type="text" id="upcd" name="upcd" disabled="disabled"><br>
		�ڵ��̸� : <input type="text" id="cdname" name="cdname" disabled="disabled"><br>
		��뿩�� : <input type="checkbox" name="useyn" id="useyn" disabled="disabled"> ���<br><br>
		&nbsp;&nbsp;<input type="button" name="addBtn" id="addBtn" value="�߰�"> &nbsp;&nbsp;
		&nbsp;&nbsp;<input type="button" name="uptBtn" id="uptBtn" value="����"> &nbsp;&nbsp;
		&nbsp;&nbsp;<input type="submit" name="saveBtn" id="saveBtn" value="����"> &nbsp;&nbsp;
	</form>


</body>
</html>