<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">

<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
}
</style>

content.jsp
<br>
<br>
<%@include file="../display/mall_top.jsp"%>
<%
	int num = Integer.parseInt(request.getParameter("num")); //지금
	int pn = Integer.parseInt(request.getParameter("pageNum"));

	
	BoardDao dao = BoardDao.getInstance();
	BoardBean article = dao.getArticle(num); //article은 update set으로 바꾸는 것이다.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	System.out.println("num:"+ article.getNum());
	System.out.println("ref:"+ article.getRef());
	System.out.println("re_step:"+ article.getRe_step());
	System.out.println("re_level:"+ article.getRe_level());
	
	int ref=article.getRef(); //전
	int re_step=article.getRe_step();
	int re_level=article.getRe_level();
	int _num=article.getNum();
	session.setAttribute("memnum",_num);
%>

<body>
	<table width="500" border="1" cellspacing="0">
		<h2>
			<b align="center">상품/사이즈 문의</b>
		</h2>


		<tr height="30">
			<td align="center" width="50" bgcolor="beige">글제목</td>
			<td align="center" width="375" colspan="3"><%=article.getSubject() %></td>
		</tr>
		<tr height="30">
			<td align="center" width="50" bgcolor="beige">작성자</td>
			<td align="center" width="125"><%=memid %></td>
		</tr>

		<tr height="30">
			<td align="left" width="375" colspan="3">&nbsp;&nbsp; <%=article.getContent() %>
			</td>
		</tr>
	</table>
	
	<table border="1" align="center">
		<tr>
			<td bgcolor="navy"><a
				href="updateForm.jsp?num=<%=article.getNum()%>&pagenum=<%=pn%>"><font
					color="white">글수정</font></a></td>

			<td bgcolor="navy"><a
				href="deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pn%>"><font
					color="white">글삭제</font></a></td>
			<td bgcolor="navy"><a
				href="replyForm.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>"><font
					color="white">답글쓰기</font></a></td>
			<td bgcolor="navy"><a href="list.jsp?pageNum=<%=pn%>"><font
					color="white">글목록</font></a></td>
		</tr>
	</table>


</body>

<%@include file="../display/mall_bottom.jsp"%>



