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
	
		$('#insertBtn').click(function(){
			var mobiletelno = $('#mobiletelno').val();
			var hometelno = $('#hometelno').val();
			if($('input[name=useyn]:checked')){
				var useyn = 'Y';
			}else{
				var useyn = 'N';
			}
			var relcd = $('#relcd option:selected').val();
			
			if(mobiletelno == null && hometelno == null ){
				alert('����ȭ��ȣ Ȥ�� �ڵ�����ȣ �� �� �ϳ��� �Է��ؾ��մϴ�');
				$('#mibiletelno').focus();
			}else{
				$.ajax({
					url:'userinfodetailinsert',
					type:'post',
					data:{
							relcd:relcd,
							delivname:$('#delivname').val(),
							addrcd:$('#addrcd').val(),
							addrname:$('#addrname').val(),
							mobiletelno:mobiletelno,
							hometelno:hometelno,
							useyn:useyn
					},
					success:function(data){
						if(data.code == 0){
							alert('���强��');
						}else{
							alert('�������');
							location.reload();
						}
					}
				})
			}
		})
	})


</script>
<title>detail</title>
</head>
<body>

	<!-- <select name="searchType" id = "searchType">
			<option> �� ��</option>
			<option value="name" id="searName">�۾���</option>
			<option value="subject" id="searSub">����</option>
			<option value = "subCont" id="searSubcont">���� + ����</option>
		</select> -->


	<h1>������(detail)</h1>
	����        : <input type="text" id="delivname" name="delivname" placeholder="������ �Է��Ͻÿ�"><br>
	����        : <select name="relcd" id="relcd">
				<option value="C0021">����</option>
				<option value="C0022">�θ��</option>
				<option value="C0023">����</option>
				<option value="C0024">����</option>
			  </select><br>
	�����ȣ        : <input type="text" id="addrcd" name="addrcd" placeholder="�����ȣ"><br>
	�ּ�        : <input type="text" id="addrname" name="addrname" placeholder="�ּҸ� �Է��Ͻÿ�"><br>
	�޴���ȭ��ȣ        : <input type="text" id="mobiletelno" name="mobiletelno" placeholder="�޴���ȭ��ȣ"><br>
	����ȭ��ȣ        : <input type="text" id="hometelno" name="hometelno" placeholder="����ȭ"><br>
	��뿩�� :  <input type="checkbox" name="useyn" id="useyn" checked="checked"> ���
	<br>
	
	<input type="button" name="insertBtn" id="insertBtn" value="����">
	
	
	
	
	
	
</body>
</html>