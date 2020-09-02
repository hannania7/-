<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_order.jsp 결재하기 클릭 => mall_calculate.jsp <br><br> -->
mall_calculate.jsp
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="order" class="my.shop.mall.OrdersDao" scope="session"/>

<%
	String msg = "" , url="";
	Vector<ProductBean> cv=mallCart.getAllProducts();
	int no=(Integer)session.getAttribute("memno");
	int cnt=order.insertOrders(no,cv);	
    if(cnt >= 0){
    	msg = "주문 성공";         
    	url = "mall.jsp";
    	
    	mallCart.removeAllProduct();
		%>
    	<script type="text/javascript">
    	alert("<%=msg%>");
    	var answer = confirm("계속 하시겠습니까?"); //확인, 취소
    	if(answer){
    		location.href="<%=url%>";
    	}else{
    		location.href="<%=request.getContextPath()%>/main.jsp";
    	}
    	
    	</script>
    	<%
    }
    else{
    	msg = "주문 실패";
    	url = "mall_order.jsp";
    }
        %>    
		
