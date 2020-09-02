<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">

<!-- top.jsp <br><br> -->
<style type="text/css">
	body{
		text-align: center;
		}
	table{
		margin : 0px auto;
	}	

</style>

<font size=6>쇼핑몰(관리자화면)</font> <br>
<a href="main.jsp"><font size=3>쇼핑몰홈</a>
<a href="<%=request.getContextPath() %>/myshop/admin/main.jsp"><font size=3>메인홈</font></a>
<a href="<%=request.getContextPath() %>/logout.jsp"><font size=3>로그아웃</font></a>    

<br><br>

<table border="1" width="800" height="400">
	<tr height="40">
		<td align="center">
			<a href="<%=request.getContextPath() %>/myshop/admin/cate_input.jsp">카테고리 등록</a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath() %>/myshop/admin/cate_list.jsp">카테고리 목록</a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath() %>/myshop/admin/prod_input.jsp">상품 등록 </a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath() %>/myshop/admin/prod_list.jsp">상품 목록</a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath() %>/myshop/admin/shopping_list.jsp">쇼핑 내역</a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath() %>/myshop/display/mall.jsp">사용자 홈</a>
		</td>
	</tr>	
	
	
	<tr height=320>
