<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartAdd.jsp<br><br> -->
mall_cartAdd.jsp
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/> 
<%  
	request.setCharacterEncoding("UTF-8");
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	int oqty=Integer.parseInt(request.getParameter("oqty"));
	ProductDao pdao=ProductDao.getInstance();
	
	ArrayList<ProductBean> list=pdao.getOneProduct(pnum);
	
	mallCart.addProduct(pnum,oqty); 
	
	response.sendRedirect("mall_cartList.jsp");
%>