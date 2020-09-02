<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartDel.jsp<br><br> -->
mall_cartDel.jsp
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
int pnum=Integer.parseInt(request.getParameter("pnum"));
mallCart.removeProduct(pnum);
response.sendRedirect("mall_cartList.jsp");

%>