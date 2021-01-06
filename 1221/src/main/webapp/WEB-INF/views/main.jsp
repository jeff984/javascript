<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		$('#empListBtn').click(function(){
			location.href="empList";
		});
		
		$('#inviteMemberBtn').click(function(){
			location.href="inviteMember";
		});
		
		$('#detailBtn').click(function(){
			location.href="detail";
		});
		
		$('#codemngBtn').click(function(){
			location.href="codemng";
		});
		
		$('#itemlistBackupBtn').click(function(){
			location.href="itemlistBackup";
		});
		
		$('#itemlistBtn').click(function(){
			location.href="itemlist";
		});
		
		$('#outitemlistBtn').click(function(){
			location.href="outitemlist";
		});
		
		
	})

</script>

</head>
<body>
	<h1>main(백도어)</h1>
	<input type="button" style="width:60pt; height:40pt;" name="empListBtn" id="empListBtn" value="empList">&nbsp;&nbsp;
	<input type="button" style="width:75pt; height:40pt;" name="inviteMemberBtn" id="inviteMemberBtn" value="inviteMember">&nbsp;&nbsp;
	<input type="button" style="width:60pt; height:40pt;" name="detailBtn" id="detailBtn" value="detail">&nbsp;&nbsp;
	<input type="button" style="width:60pt; height:40pt;" name="codemngBtn" id="codemngBtn" value="codemng">&nbsp;&nbsp;
	<input type="button" style="width:60pt; height:40pt;" name="itemlistBackupBtn" id="itemlistBackupBtn" value="(구)itemlist">&nbsp;&nbsp;
	<input type="button" style="width:60pt; height:40pt;" name="itemlistBtn" id="itemlistBtn" value="(신)itemlist">&nbsp;&nbsp;
	<input type="button" style="width:60pt; height:40pt;" name="outitemlistBtn" id="outitemlistBtn" value="outitemlist">&nbsp;&nbsp;
	
	
	<!-- <a href="empList">empList</a><br>
	<a href="inviteMember">inviteMember</a><br>
	<a href="detail">detail</a><br>
	<a href="codemng">codemng</a><br>
	<a href="itemlist">itemlist</a> -->
	

</body>
</html>