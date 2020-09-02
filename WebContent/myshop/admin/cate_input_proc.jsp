<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cate_input_proc.jsp <br><br> -->
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cbean" class="my.shop.CategoryBean"/>
<jsp:setProperty property="*" name="cbean"/>
<%
CategoryDAO sdao=CategoryDAO.getInstance();
int cnt=sdao.insertCategory(cbean);
String msg="", url="";
if(cnt>0){
	msg="카테고리 등록 성공";
	url="cate_list.jsp";
}
else{
	msg="카테고리 등록 실패";
	url="cate_input.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다");
location.href="<%=url%>"; 
</script>