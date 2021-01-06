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
			alert('비밀번호는 5글자 이상, 10글자 미만이어야 합니다');
			return false;
		}else{
			return true;
		}
	}
	
	function pwpwCheck(){
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		if(password1 != password2){
			alert('비밀번호와 비밀번호 확인이 불일치합니다')
			return false;
		}else{
			return true;
		}
	}
	
	function nameCheck(){
		var name = $('#name').val();
		if(name.length == 0 ){
			alert('이름을 입력하시오');
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
						alert('가입이 가능한 아이디입니다');
					}else{
						alert('중복된 아이디입니다');
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
							alert('회원가입에 성공');
							location.href="detail";
						}else{
							aert('회원가입에 실패했습니다');
						}
					}
				});//ajax
			}else{
				alert('모든 항목이 필수입력항목입니다');
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
	<h1>회원가입</h1>
	
	아이디 : <input type="text" id="joinid" name="id" placeholder="아이디를 입력하시오">
	<input type="button" id="dupCheckBtn" name="dupCheckBtn" value="중복확인">
	<br>
	비밀번호 : <input type="password" id="password1" name="password" placeholder="비밀번호를 입력하시오"><br>
	비밀번호확인 : <input type="password" id="password2" name="password" placeholder="비밀번호를 입력하시오"><br>
	성명 : <input = "text" id="name" name="name" placeholder="성명을 입력하시오"><br>
	<input type="button" id="saveBtn" name="saveBtn" value="저장">
	



</body>
</html>