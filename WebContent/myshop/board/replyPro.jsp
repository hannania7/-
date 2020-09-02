<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
replyForm.jsp=>replyPro.jsp <br><br>


<%
	request.setCharacterEncoding("UTF-8");

%>

<!-- 매개변수 없는 생성자가 반드시 있어야 한다. -->
<jsp:useBean id="article" class="board.BoardBean"/>
<jsp:setProperty property="*" name="article"/>

<%
	//new Timestamp(System.currentTimeMillis()); //Timestamp는 숫자를 날짜형태로 바꿈
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	//request.getRemoteAddr(); //getRemoteAddr는 ip주소를 문자열로 가지고옴
	article.setIp(request.getRemoteAddr());
	
	BoardDao dao = BoardDao.getInstance();
	int cnt=dao.replyArticle(article);
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
	else{
		response.sendRedirect("writeForm.jsp");
	}
%>