<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
findid.jsp
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>
<br>
<form action="findidPro.jsp" method="post">
	<table border="1" align="center">
	<h2 align="center">Forgot ID</h2>
		<tr>
			<td bgcolor="beige" align="center" width="100">이름</td>
			<td><input type="text" name="name" value="원태찬" width="100"></td>
		</tr>
		<tr>
			<td bgcolor="beige" align="center" width="100">이메일</td>
			<td>
				<input type="text" name="email" value="a@a" width="100">
					
 
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="beige" align="center"><input
				type="submit" value="아이디찾기"></td> 
		</tr>
	</table>
</form>