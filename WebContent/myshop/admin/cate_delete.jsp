<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- cate_delete.jsp<br> -->
<%
request.setCharacterEncoding("UTF-8");
%>

<%
CategoryDAO dao=CategoryDAO.getInstance();
int cnum=Integer.parseInt(request.getParameter("cnum"));
int cnt=dao.deleteCategory(cnum);           




String msg="", url="";
if(cnt>0){
	msg="카테고리 삭제 성공";
	url="cate_list.jsp";
 
}
 else{
	msg="카테고리 삭제 실패";
	url="cate_list.jsp";
	
 }

%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다.");
location.href="<%=url%>";

</script>