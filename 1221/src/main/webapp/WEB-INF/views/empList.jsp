<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


</script>
<title>empList</title>
</head>
<body>
	<h1>empList</h1>
	<table border="1">
		<tr>
			<td>ename</td>
			<td>comm</td>
			<td>hiredate</td>
			<td>empnmo</td>
			<td>mgr</td>
			<td>job</td>
			<td>deptno</td>
			<td>sal</td>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.ename }</td>
				<td>${list.comm}</td>
				<td>${list.hiredate}</td>
				<td>${list.empno}</td>
				<td>${list.mgr}</td>
				<td>${list.job}</td>
				<td>${list.deptno}</td>
				<td>${list.sal}</td>
			</tr>
		</c:forEach>	
	
	</table>

</body>
</html>