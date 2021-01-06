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
				alert('집전화번호 혹은 핸드폰번호 둘 중 하나는 입력해야합니다');
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
							alert('저장성공');
						}else{
							alert('저장실패');
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
			<option> 선 택</option>
			<option value="name" id="searName">글쓴이</option>
			<option value="subject" id="searSub">제목</option>
			<option value = "subCont" id="searSubcont">제목 + 내용</option>
		</select> -->


	<h1>상세정보(detail)</h1>
	성명        : <input type="text" id="delivname" name="delivname" placeholder="성명을 입력하시오"><br>
	관계        : <select name="relcd" id="relcd">
				<option value="C0021">본인</option>
				<option value="C0022">부모님</option>
				<option value="C0023">동생</option>
				<option value="C0024">지인</option>
			  </select><br>
	우편번호        : <input type="text" id="addrcd" name="addrcd" placeholder="우편번호"><br>
	주소        : <input type="text" id="addrname" name="addrname" placeholder="주소를 입력하시오"><br>
	휴대전화번호        : <input type="text" id="mobiletelno" name="mobiletelno" placeholder="휴대전화번호"><br>
	집전화번호        : <input type="text" id="hometelno" name="hometelno" placeholder="집전화"><br>
	사용여부 :  <input type="checkbox" name="useyn" id="useyn" checked="checked"> 사용
	<br>
	
	<input type="button" name="insertBtn" id="insertBtn" value="저장">
	
	
	
	
	
	
</body>
</html>