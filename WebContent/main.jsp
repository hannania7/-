<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main.jsp<br><br> -->
main.jsp
<%
session.invalidate();
%>
<script type="text/javascript">
function gosubmit(){
	document.f.submit();
}



</script>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>
<h2 align="center">MEMBER LOGIN</h2>
<form action="loginPro.jsp" method="post" name="f">
<table border="1" align="center">
<tr>
	<td>아이디</td>
	<td><input type="text" name="id" value="admin"></td>
	</tr>       
	<tr>
	<td>비번</td>
	<td><input type="password" name="password" value="1234"></td>
	</tr>
	<tr> 
	<td> 
	
	             
	<a href="javascript:gosubmit()"><font color="black">로그인|</font></a> 
	<a href="<%=request.getContextPath() %>/myshop/member/register.jsp"><font color="black">회원가입|</font></a>
	<a href="<%=request.getContextPath() %>/findid.jsp"><font color="black">아이디찾기|</font></a>    
	<a href="<%=request.getContextPath() %>/findpwd.jsp"><font color="black">비밀번호찾기</font></a>
	</td>     
	</tr>     
</table>
</form>