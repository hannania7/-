<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %> 

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
      
list.jsp<br>
<%@include file="../display/mall_top.jsp" %>
</table>      
<%
	
	int pageSize = 10; //이것은 한 페이지에 몇 개의 글이 보이냐를 뜻함. 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0 ;
	int number = 0;
	 
	
 	ArrayList<BoardBean> alists = null;
	BoardDao dao = BoardDao.getInstance();
	count = dao.getArticleCount(); // 전체 레코드 갯수 리턴 
	System.out.println("count:" + count);
	if(count > 0){
		alists = dao.getArticles(startRow,endRow);// 1~10 11~20
	}
	
	number = count - (currentPage-1) * pageSize;  /* 37-(2-1)*10=27 */
	       
%>
<body> 
<h2><b align="center">상품/사이즈 문의</b></h2>     
<table width="700">
<tr>
<td bgcolor="beige" width="10%">번호</td>
<td align="center" bgcolor="beige" width="80%">제목</td>
<td bgcolor="beige" align="right" width="10%">작성자</td>         
</tr>
</table>     
      
<%
	if(count == 0){
%>
	<table width="100%">
		<tr height="30">
			<td align="center">공지사항이 없습니다.</td>
		</tr>   
		      
	</table>
	
<%		
	} else{
		   
%>
	<table width="700" align="center">
<%
		//for(BoardBean article : alists){
		for(int i=0;i<alists.size();i++){
			BoardBean article = alists.get(i); //어레이 리스트로 가져온 값을 article에 집어넣음
%> 
			<tr height="30">
				<td align="left">&nbsp;&nbsp;<%=number-- %></td>
				<td align="left"> 
				<%
					int wid = 0;
					if(article.getRe_level() > 0){ // 답글
						wid = article.getRe_level() * 20; // 답글:20, 답글의답글:40
					
				%>
						<img src="images/level.gif" width="<%=wid %>" height="16">
						<img src="images/re.gif">
				<%
					}
					else{ // 원글
				%>
						<img src="images/level.gif" width="<%=wid %>" height="16">
				<%
					}
				%>
				
					<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage%>"><%=article.getSubject() %></a>
					<%
					if(article.getReadcount()>=10){
						%>
						<img src="images/hot.gif">
					<%}
					%>
				</td>
				<td align="right"> <%=memid %></td>
				
			</tr>
<%			  
		} // for
%>
	
	</table>
	
<%		
	} // else
%>

<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		int pageBlock = 10; //페이지가 1~10까지 보이도록 설정한다.
		
		int startPage = ((currentPage - 1) / pageBlock * pageBlock) +1 ;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		if(startPage > 10){
%>
			<a href="list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%			
		}
		%><br><% 
		for(int i=startPage;i<=endPage;i++){
%>
			<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a> <!-- 페이지 하단에 1~10을 표시함 -->
<%			
		}
		if(endPage < pageCount) {
%>
			<a href="list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
<%			
		}
	}
%>





</body>
<table width="700">
	<tr height="30"> 
	<td width=90%>
	</td>
		<%if(!memid.equals("admin")){%>
		<td align="center" width=10% bgcolor="navy">       
			<a href="writeForm.jsp"><font color="white">글쓰기</font></a><%}%>
		</td>      
	</tr>        
	</table>
<%@include file="../display/mall_bottom.jsp"%>



