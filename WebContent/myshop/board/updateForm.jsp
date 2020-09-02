<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <jsp:useBean id="dao" class="board.BoardDao"/> --%>
<link href="style.css"  rel="stylesheet" type="text/css">
<style type="text/css">
body {
    width: 100%;
    text-align : center;
}
table {
    margin: 0 auto;
    border-collapse: collapse;
}   
</style>     

  <%
	int num=(int)session.getAttribute("memnum");
	String pageNum = request.getParameter("pageNum");
	     
	
	// dao객체 얻어오기
	BoardDao dao=BoardDao.getInstance();
	BoardBean article =  dao.updateGetArticle(num);
	%>
<script type="text/javascript">
    

function gowrite(){
	passwd=document.writeform.passwd.value;
	if(passwd==""){
		alert("패스워드 누락");
	}
	else{
		document.writeform.submit();
	}
}

  


</script>
updateForm.jsp<br><br>
<%@include file="../display/mall_top.jsp" %>
<h3 align="center">글수정</h3>
<body>
<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum %>"  onsubmit="return writeSave()">
	<table border="1" width="450" align="center" cellspacing="0">
		
		<tr>
			<td width="100" align="center" bgcolor="beige">이름</td>
			<td><input type="text" size="30" maxlength="10"	
					name="writer" value="<%=memid%>">
					<input type="hidden" name="num" value="<%= article.getNum()%>">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center" bgcolor="beige">제 목</td>
			<td width="350" align="left">					
				<input type="text" size="50" maxlength="50" 
					name="subject"	value="<%=article.getSubject()%>">
			</td>
		</tr>
				
		
				
		<tr>
			<td width="100"  align="center" bgcolor="beige">내 용</td>
			<td width="350">
				<textarea name="content" id="abc" rows="13" cols="50"><%=article.getContent()%></textarea>
				
			</td>
		</tr>
		
		<tr>
			<td width="100"  align="center" bgcolor="beige">비밀번호</td>
			<td width="350">
				<input type="password" size="10" maxlength="12"	
					name="passwd">
			</td>
		</tr>
		</table>
		<table align="center" border="1">
		<tr>
			<td bgcolor="navy">
			<a href="javascript:gowrite()"><font color="white">글쓰기</font></a> </td> 
				<td bgcolor="navy">
				<a href="list.jsp"><font
					color="white">글목록</font></a></td>
				
			
		</tr>
	</table>
</form>
</body>
<%@include file="../display/mall_bottom.jsp"%>