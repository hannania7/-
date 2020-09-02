<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="color.jsp"%>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	
	function godelete(){
		if(document.delForm.passwd.value == ""){
			alert("비밀번호를 입력하십시오");
			document.delForm.passwd.focus();
			return false;
		}
		else{
			document.delForm.submit();
		}
	}

</script>

deleteForm.jsp
<br>
<br>
<%@include file="../display/mall_top.jsp"%>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		int pn = Integer.parseInt(request.getParameter("pageNum"));
%>

<body>
	<b>글삭제</b>
	<br>
	<form method="POST" name="delForm"
		action="deletePro.jsp?pageNum=<%= pn %>"
		onsubmit="return deleteSave()">
		<table border="1" align="center" width="360">
			<tr height="30">
				<td align=center bgcolor="beige"><b>비밀번호를 입력해 주세요.</b></td>
			</tr>

			<tr height="30">
				<td align=center>비밀번호 : <input type="password" name="passwd"
					size="8" maxlength="12"> <input type="hidden" name="num"
					value="<%=num %>">
				</td>
			</tr>
			</table>
			<table border="1">
			<tr height="30">
				<td align="center" bgcolor="navy">
				<a href="javascript:godelete()"><font color="white">글삭제</font></a>
		    </td>
		    <td bgcolor="navy">
		      <a href="list.jsp?pageNum=<%= pn %>"><font color="white">글목록</font></a>     
		   </td>
		 </tr>  
	</table> 
</form>
</body>
<%@include file="../display/mall_bottom.jsp"%>