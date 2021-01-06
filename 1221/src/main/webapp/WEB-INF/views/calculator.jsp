<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계산기</title>
<style type="text/css">
	catpion {
		font-size: 32px;
	}
	table {
		width: 320px;
	}
	table, th {
		background : #333;
	}
	th {
		padding-right : 10px;
		height:80px;
	}
	td{
		height : 75px;
		text-align: center;
	}
	th > input {
		width:100px;
		border: none;
		background: #333;
		color: white;
		text-align: right;
		font-size : 48px;
	}
	td> input[type="button"] {
		width: 100%;
		height: inherit;
		color: #333;
		font-size: 36px;
		border: none;
	}
	td>input[type="button"]:hover {
		background: #999;
	}
	td:last-child > input{
		background: orange;
		color: white;
	}
</style>

</head>
<body>
	<h1>계산기(21.01.06)</h1>
	
	<form name="cal">
		<table>
			<caption>계산기</caption>
			<tr>
				<th colspan="4"><input type="text" name="result" value="0"></th>
			</tr>	
			<tr>
				<td><input type="button" value="7"></td>
				<td><input type="button" value="8"></td>
				<td><input type="button" value="9"></td>
				<td><input type="button" value="+"></td>
			</tr>
			<tr>
				<td><input type="button" value="4"></td>
				<td><input type="button" value="5"></td>
				<td><input type="button" value="6"></td>
				<td><input type="button" value="-"></td>
			</tr>
			<tr>
				<td><input type="button" value="1"></td>
				<td><input type="button" value="2"></td>
				<td><input type="button" value="3"></td>
				<td><input type="button" value="*"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="0"></td>
				<td><input type="button" value="%"></td>
				<td><input type="button" value="/"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" class="cls_btn" value="clear"></td>
				<td colspan="2"><input type="button" class="result_btn" value="="></td>
			</tr>
		</table>
	</form>

<script type="text/javascript">
	var inp = document.forms['cal'];
	var input = inp.getElementsByTagName('input');
	var cls_btn = document.getElementsByClassName('cls_btn')[0];
	var result_btn = document.getElementsByClassName('result_btn')[0];

	function clr(){
		inp['result'].value = 0;
	}

	function calc(value){
		if(inp['result'].value == 0){
			inp['result'].value='';
		}
		inp['result'].value += value;
	}
	
	function my_result(){
		var result = document.forms['cal']['result'];
		var calc = eval(result.value);
		
		inp['result'].value = calc;
	}
	
	for(var i = 0; i < input.length; i++){
		if(input[i].value != '=' && input[i].value != 'clear'){
			input[i].onclick = function(){
				calc(this.value);	
			}
		}//end if
	}//end for
	
	cls_btn.onclick = function(){
		clr();
	}
	result_btn.onclick = function(){
		try{
			my_result();
		}
		catch(err){
			var result = inp['result'];
			result.value = '입력 오류';
		}
	}
</script>
	

</body>
</html>