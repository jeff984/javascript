<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		$('#loginBtn').click(function(){
			
			if($('#identity').val().length ==0 ){
				alert('���̵� �Է��Ͻÿ�');
			}else if($('#password').val().length ==0){
				alert('��й�ȣ�� �Է��Ͻÿ�');
			}else{
				$('#loginFrm').attr('action','login').attr('method','post').submit();	
			}
		})
		
		$('#inviteBtn').click(function(){
			location.href="inviteMember";
		})
	})



</script>
<title>loginf</title>
</head>
<body>
	<h1>loginf</h1>
	<form name="loginFrm" id="loginFrm">
		�� �� �� :<input type="text" id="identity" name="id" placeholder="���̵� �Է��Ͻÿ�" ><br>
		��й�ȣ : <input type="password" id="password" name="password" placeholder="��й�ȣ�� �Է��Ͻÿ�">
		<br>
		<input type="button" name="loginBtn" id="loginBtn" value="�α���">
		<input type="button" name="inviteBtn" id="inviteBtn" value="ȸ������">
	</form>


</body>
</html>