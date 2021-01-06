<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	//var icheck = false;
	var pcheck = false;
	var ppcheck = false;
	var ncheck = false;
	
	function pwCheck(){
		var password1 = $('#password1').val();
		if(password1.length<5 || password1.length>10 ){
			alert('��й�ȣ�� 5���� �̻�, 10���� �̸��̾�� �մϴ�');
			return false;
		}else{
			return true;
		}
	}
	
	function pwpwCheck(){
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		if(password1 != password2){
			alert('��й�ȣ�� ��й�ȣ Ȯ���� ����ġ�մϴ�')
			return false;
		}else{
			return true;
		}
	}
	
	function nameCheck(){
		var name = $('#name').val();
		if(name.length == 0 ){
			alert('�̸��� �Է��Ͻÿ�');
			return false;
		}else{
			return true;
		}
	}
	
	
	
	
	$(function(){
		
		/* $('#joinid').focus();
		$('#joinid').focusout(function(){
			icheck = idCheck();
		}); */
		
		$('#password1').focus();
		$('#password1').focus(function(){
			pcheck = pwCheck();
		})
		
		$('#password2').focus();
		$('#password2').focusout(function(){
			ppcheck = pwpwCheck();
		})
		
		$('#name').focus();
		$('#name').focusout(function(){
			ncheck = nameCheck();
		})
		
		
		
		
		
		$('#dupCheckBtn').click(function(){
			var joinid = $('#joinid').val();
			$.ajax({
				url: "idCheck",
				type: "post",
				data: {id : joinid} ,
				success:function(data){
					if(data.result){
						alert('������ ������ ���̵��Դϴ�');
					}else{
						alert('�ߺ��� ���̵��Դϴ�');
					}
				}
				
			})
		})
		
		
		
		$('#saveBtn').click(function(){
			if(pcheck == true && ppcheck == true && ncheck == true){
				$.ajax({
					url:'join',
					type:'post',
					data:{
						id:$('#joinid').val(),
						password:$('#password').val();
						name : $('#name').val();
					},
					success:function(data){
						if(data.result){
							alert('ȸ�����Կ� ����');
							location.href="detail";
						}else{
							aert('ȸ�����Կ� �����߽��ϴ�');
						}
					}
				});//ajax
			}else{
				alert('��� �׸��� �ʼ��Է��׸��Դϴ�');
			}
		});
	});
	
	/* @RequestMapping(value="join")
	public ModelAndView join(ModelAndView mv, ClientVO cv) {
		cv.setPassword(passwordEncoder.encode(cv.getPassword()));
		if (service.insert(cv) > 0) {
			mv.addObject("result",true);
		}else {
			mv.addObject("result",false);
		}
		mv.setViewName("jsonView");
		return mv;
	} */
	
	
	


</script>
</head>
<body>
	<h1>ȸ������</h1>
	
	���̵� : <input type="text" id="joinid" name="id" placeholder="���̵� �Է��Ͻÿ�">
	<input type="button" id="dupCheckBtn" name="dupCheckBtn" value="�ߺ�Ȯ��">
	<br>
	��й�ȣ : <input type="password" id="password1" name="password" placeholder="��й�ȣ�� �Է��Ͻÿ�"><br>
	��й�ȣȮ�� : <input type="password" id="password2" name="password" placeholder="��й�ȣ�� �Է��Ͻÿ�"><br>
	���� : <input = "text" id="name" name="name" placeholder="������ �Է��Ͻÿ�"><br>
	<input type="button" id="saveBtn" name="saveBtn" value="����">
	



</body>
</html>