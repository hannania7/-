<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_top.jsp <br><br> -->
<%
	String contextPath = request.getContextPath();
	String memid=(String)session.getAttribute("memid");
%>

<link rel="stylesheet" type="text/css" href="<%=contextPath %>/style.css">
<style type="text/css">
	.logout{
		float : right;
	}

</style>
<table width="770px" border="1" align="center">
	<tr>
		<td colspan="2" align="center">
			<a href="<%=contextPath %>/myshop/admin/main.jsp">HOME</a>
			<%if(memid.equals("admin")){%>
			
			<a href="<%=contextPath %>/myshop/admin/main.jsp">관리자홈</a>		
			<%}%>		
			<a href="<%=contextPath %>/myshop/display/mall.jsp">쇼핑몰홈</a>		
			<a href="<%=contextPath %>/myshop/display/mall_cartList.jsp">장바구니</a>		
			<a href="<%=contextPath %>/myshop/board/list.jsp">게시판</a>		
			<a href="<%=contextPath %>/myshop/display/company.jsp">회사소개</a>
			
			<a class="logout" href="<%=contextPath%>/logout.jsp">
				<img src="<%=contextPath %>/myshop/images/logout.jpg" width="50" height="20">
			</a>
			<span class="logout"><%=memid %>님</span>		
		</td>	
	</tr>
	
	<tr>
		<td width="180px" align="center" border="1" valign="top">
		
		<%
		
		%>
		<table width="100%" align="left" valign="top" border="1">
		
			<tr>
				<td>
				
				<a href="<%=contextPath%>/myshop/display/CEO.jsp"><font color="red">CEO 인사말</font>
				
				</a>   <!--  이것은 왼쪽에 형식만들기 -->      
				</td>	
			</tr>
			
			<tr>
				<td>
				
				<a href="<%=contextPath%>/myshop/display/history.jsp"><font color="red">회사 연혁</font>
				 
				</a>   <!--  이것은 왼쪽에 형식만들기 -->      
				</td>	
			</tr>
			
			<tr>
				<td>
		
				<a href="<%=contextPath%>/myshop/display/chart.jsp"><font color="red">조직도</font>
				
				</a>   <!--  이것은 왼쪽에 형식만들기 -->      
				</td>	
			</tr>
			<%
			
		
			%>
		
			
		</td>
		<td width="600px" align="center" valign="top">
		
		
	