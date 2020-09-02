<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--mall_cartList.jsp-> mall_cartEdit.jsp<br><br> -->
mall_cartEdit.jsp
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>


<%	
	request.setCharacterEncoding("UTF-8");
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	int oqty=Integer.parseInt(request.getParameter("oqty"));
	
	ProductDao pdao=ProductDao.getInstance();
	ArrayList<ProductBean> lists=pdao.getOneProduct(pnum);
	if(lists.get(0).getPqty() < oqty){%>
		<script type="text/javascript">
		alert("주문 수량이 초과 되었습니다.");
		//history.go(-1);
		location.href="mall_cartList.jsp";
		</script>
		
	<%}//남은 재고보다 입력한 재고가 크다면

	//주문수량 장바구니에서 수정
	mallCart.setEdit(pnum,oqty); //주문수량 수정하는 메서드
	//response.sendRedirect("mall.cartList.jsp"); //response는 alert가 안뜸 따라서 자바스크립트로 location을 써야함.
	%>
	<script type="text/javascript">
		location.href="mall_cartList.jsp";
	</script>
	

	