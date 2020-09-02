<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
replyForm.jsp
<br>
<br>
<%@include file="../display/mall_top.jsp"%>



<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>

<%
int ref=Integer.parseInt(request.getParameter("ref"));
System.out.println(ref);
int re_step=Integer.parseInt(request.getParameter("re_step"));
int re_level=Integer.parseInt(request.getParameter("re_level"));
%>

<script type="text/javascript">




function writeSave(){
	var writer=document.writeform.writer.value;
	if(writer==""){
		alert("이름 누락");
		return false;
	}
	
	var subject=document.writeform.subject.value;
	if(subject==""){
		alert("제목 누락");
		return false;
	}
	
	var content=document.writeform.content.value;
	if(content== ""){
		alert("내용 누락");
		return false;
	}
	
	var passwd=document.writeform.passwd.value;
	if(passwd==""){
		alert("패스워드 누락");
		return false;
	}
	
	if(writer!="" && subject!="" && content!="" &&passwd!=""){
		document.writeform.submit();
	}
}





</script>



<form method="post" name="writeform" action="replyPro.jsp"
	onsubmit="return writeSave()">
	<input type="hidden" name="ref"
		value="<%=request.getParameter("ref")%>"> <input type="hidden"
		name="re_step" value="<%=request.getParameter("re_step")%>"> <input
		type="hidden" name="re_level"
		value="<%=request.getParameter("re_level")%>">
	<table border="1" width="450" align="center" cellspacing="0">
		<h3 align="center">답글쓰기</h3>
		<tr>
			<td width="100" align="center" bgcolor="beige">이름</td>
			<td><input type="text" size="30" maxlength="10" name="writer"
				value="<%=memid%>"></td>
		</tr>
		<tr>
			<td width="100" align="center" bgcolor="beige">제목</td>
			<td width="350" align="left"><input type="text" size="50"
				maxlength="50" name=subject " value="[답글]"></td>
		</tr>

		<tr>
			<td width="100" align="center" bgcolor="beige">내용</td>
			<td width="350"><textarea name="content" id="abc" rows="13"
					cols="50">호호호</textarea></td>
		</tr>
		<tr>
			<td width="100" align="center" bgcolor="beige">비밀번호</td>
			<td width="350"><input type="password" size="10" maxlength="12"
				name="passwd" value="1234"></td>
		</tr>
	</table>
	<table border="1" align="center">
		<tr>
			<td height="30" bgcolor="navy"><a href="javascript:writeSave()"><font
					color="white">답글쓰기</font></a></td>
			<td height="30" bgcolor="navy"><a href="list.jsp"><font
					color="white">글목록</font></a></td>
		</tr>
	</table>
</form>
<%@include file="../display/mall_bottom.jsp"%>











