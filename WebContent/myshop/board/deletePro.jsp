<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
deleteForm.jsp -> deletePro.jsp<br><br>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao dao = BoardDao.getInstance();
	
	int cnt = dao.deleteArticle(num,passwd); // 15번, 패스워드
	/*  15번 passwd만 select == passwd => 삭제 1
	15번 passwd만 select != passwd => 삭제 0 */ 
	
	if(cnt>0){
		
		int count = dao.getArticleCount(); // 전체 레코드 갯수 리턴 
		System.out.println("count:" + count);		
		int pageSize=10;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(pageNum > pageCount){ // 2 > 1 pageNum=페이지 숫자, pageCount=글 갯수
			response.sendRedirect("list.jsp?pageNum="+(pageNum-1)); //이럴 경우 2페이지에 있는 내용을 1페이지로 가지고옴
		}
		else{ // 2 < 10
			response.sendRedirect("list.jsp?pageNum="+pageNum); //이럴 경우 그대로간다.
		}
		
	}
	else{
%>
	<script type="text/javascript">
		alert("비번이 맞지 않습니다.");
		history.go(-1); //이전 페이지로 가라
	</script>	
<%
		response.sendRedirect("deleteForm.jsp?num="+num);
	
	}
%>


