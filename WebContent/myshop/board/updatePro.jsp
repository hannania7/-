<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updatePro.jsp<br><br>
<!-- updateForm에서 넘어온것을 bean으로 만들기 -->
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="board.BoardBean"/>

<jsp:setProperty property="*" name="bean"/>

<%
 String pageNum=request.getParameter("pageNum");
String passwd=request.getParameter("passwd");
	BoardDao dao = BoardDao.getInstance();
 int cnt=dao.updateArticle(bean);
/*성공 list.jsp
실패 updateForm.jsp(내가 입력한 비번 !=16번의 비번) */
if(cnt>0){
	response.sendRedirect("list.jsp");
}

else{
%>
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다.")
	history.back();
	</script>
	<%response.sendRedirect("updateForm.jsp");
}
    
%>