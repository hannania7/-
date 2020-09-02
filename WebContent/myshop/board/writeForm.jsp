<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
writeForm.jsp
<%@include file="../display/mall_top.jsp" %>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>

<br>
<h2 align="center">
	<b>상품/사이즈 문의</b>
</h2>
<script type="text/javascript">


function writeSave(){  
		
	document.f.submit();
 	
	
	var content=document.f.content.value;
	if(content==""){
		alert("내용 누락");
		return false;
	}
	var passwd=document.f.passwd.value;
	if(passwd==""){
		alert("패스워드 누락");
		return false;
	} 
	
		
	
		
		
		                    
}





</script>



<form method="post" action="writePro.jsp" name="f">

	<table border="1" width="100%" align="center" cellspacing="0">



		<tr>
			<td width="10%" align="center" bgcolor="beige" height="30">제목</td>
			<td width="90%" align="left"><select name="subject">
					<option value="색상&사이즈 문의 드려요^^" selected=selected>색상&사이즈
						문의 드려요^^</option>
					<option value="리오더&재입고 문의 드려요^^">리오더&재입고 문의 드려요^^</option>
					<option value="상품관련 문의 드려요^^">상품관련 문의 드려요^^</option>
					<option value="코디상품 문의 드려요^^">코디상품 문의 드려요^^</option>
			</select></td>
		</tr>

		<tr>
			<td align="center" bgcolor="beige" height="30">내용</td>
			<td><textarea name="content" name="abc" rows="13" cols="50">안녕하세요 바이모노입니다. 
빠르고 친절하게 답변 드리도록 노력하겠습니다.</textarea></td>
		</tr>
		<tr>
			<td align="center" bgcolor="beige" height="30">비밀번호</td>
			<td><input type="password" size="10" maxlength="12" name="passwd"
				value="1234"></td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td colspan="2" align="center" height="30" width="5%" bgcolor="navy">
				<a href="list.jsp"><font color="white">목록</font></a>
			</td>
			<td width="85%"></td>
			<td width="5%" align="center" bgcolor="navy"><a
				href="javascript:writeSave()"><font color="white">등록</font></a></td>
			<td width="5%" align="center" bgcolor="gray"><a href="list.jsp"><font
					color="white">취소</font></a></td>
		</tr>
	</table>
</form>
<%@include file="../display/mall_bottom.jsp"%>











