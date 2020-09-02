<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- mall_top.jsp <br><br> -->
mall_top.jsp
<%
	String contextPath = request.getContextPath();
	String memid=(String)session.getAttribute("memid");
	
	CategoryDAO cdao=CategoryDAO.getInstance();
	ArrayList<CategoryBean> lists=cdao.getAllCategory();
%>

<link rel="stylesheet" type="text/css"
	href="<%=contextPath %>/style.css">
<a href="<%=contextPath %>/myshop/display/mall.jsp"><font
	color="navy"><h1 font-style="italic" align="center">BYMONO</h1></font></a>
<table width="100%" align="center">
	<tr align="center">
		<td>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a
			href="<%=contextPath %>/myshop/admin/main.jsp"><font
				color="black">
					&nbsp;&nbsp;&nbsp;&nbsp;HOME&nbsp;&nbsp;&nbsp;&nbsp;</font></a> <%if(memid.equals("admin")){%>
			<a href="<%=contextPath %>/myshop/admin/main.jsp"><font
				color="black">&nbsp;&nbsp;&nbsp;&nbsp;관리자홈&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
			<%}%> <a href="<%=contextPath %>/myshop/display/mall.jsp"><font
				color="black">&nbsp;&nbsp;&nbsp;&nbsp;쇼핑몰홈&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
			<a href="<%=contextPath %>/myshop/display/mall_cartList.jsp"><font
				color="black">&nbsp;&nbsp;&nbsp;&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
			<a href="<%=contextPath %>/myshop/board/list.jsp"><font
				color="black">&nbsp;&nbsp;&nbsp;&nbsp;게시판&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
			<%for(CategoryBean cb:lists){
				String cgname=cb.getCname();
				String code=cb.getCode();
				int cnum=cb.getCnum();
		%> <a
			href="<%=contextPath%>/myshop/display/mall.cgList.jsp?cgname=<%=cgname %>&code=<%=code %>">
				<font color="black">&nbsp;&nbsp;&nbsp;&nbsp;<%=cgname %>&nbsp;&nbsp;&nbsp;&nbsp;
			</font>

		</a> <%         
		
			
			}
		%>


		</td>
		<td align="right"><span><%=memid %>님</span> <a class="logout"
			href="<%=contextPath%>/logout.jsp"> <img
				src="<%=contextPath %>/myshop/images/logout.jpg" width="50"
				height="20">
		</a></td>

	</tr>
</table>