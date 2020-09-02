<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartList.jsp 주문하기 클릭 -> mall_order.jsp -->
<!-- mall.prodView.jsp 즉시 구매하기 클릭 -> mall_order.jsp -->
mall_order.jsp
<%@include file="mall_top.jsp" %>
<%
	boolean flag =(boolean)application.getAttribute("flag");
	System.out.println("mall_order.jsp 위 flag : " + flag);
if(memid.equals("admin")){
%>
	<script type="text/javascript">
		alert("관리자는 주문 할 수 없습니다.");
		history.back();
	</script>
<%
}
%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
request.setCharacterEncoding("UTF-8");
int pnum=Integer.parseInt(request.getParameter("pnum"));
int oqty=Integer.parseInt(request.getParameter("oqty"));
int totalPrice=0;
DecimalFormat df=new DecimalFormat("###,###");


if(pnum !=0 && oqty !=0){ //즉시 구매하기 눌렀을 때
	if(flag==true){
		mallCart.addProduct(pnum,oqty);
	}
}

int cartTotalPrice=0;
int cartTotalPoint=0;




%>
<table width="100%">
    <tr width="100%">
    	<th colspan="8"><b>국내배송상품 주문내역</b><br><br></th>
    </tr>
    
    <tr align="center" bgcolor="beige">
    	
    	<td>이미지</td>	
    	<td>판매가</td>
    	<td>수량</td>
    	<td>적립금</td>
    	<td>배송구분</td>
    	<td>배송비</td>
    	<td>합계</td>
    	<td>선택</td>
    	
    </tr>
    
    <%
    Vector<ProductBean> cv=mallCart.getAllProducts();
    if(cv.size() == 0){//장바구니에 담은게 1개도 없다면,
    	out.print("<tr><td colspan=8 align=center><br><b>장바구니가 비어있습니다.<br><b></td></tr></table>");
    }
          
   else{
   %>
   
   <% 
    	     
    	for(ProductBean pb : cv){
    	String pimage=pb.getPimage();
    	String imgPath = request.getContextPath()+"/myshop/images/" + pb.getPimage(); %>
    	<tr align="center">
    	<td><img src="<%=imgPath%>" width="40" height="40"><b><br><%=pb.getPname() %></b></td>
    	    
    	<td><%=df.format(pb.getPrice()) %>원</td><br>
    	<td>
    			<form name="f" method="post" action="mall_cartEdit.jsp">
					<%=pb.getPqty() %>
						<input type="hidden" name="pnum" value="<%=pb.getPnum() %>">   	
	    			
    			</form>
    	</td>	
    	<td><%=pb.getPoint() %>point</td>
    	<td>기본배송</td>
    	<td>2,500원<br>조건</td>
		
    	<td>
    		<%=df.format(pb.getTotalPrice()) %>원<br>  
    	</td>
    	<td>
    				
			<a href="mall_cartDel.jsp?pnum=<%=pb.getPnum() %>">
			<font color="black">삭제</font>
			</a>
		</td>	
    </tr>
    <%
    cartTotalPrice += pb.getTotalPrice();
    	}//for
    int cartTotalPrice2=cartTotalPrice+2500;
    %>
    <tr class=m1>
    	<td>    		
    		<b>총 상품금액</b>
    		</td>
    		<td>
    		<b>총 배송비</b>
    		</td>
    		<td>
    		<b>결제예정금액</b>
    		</td>
    </tr>
    <tr>
    	<td>
    	<%=df.format(cartTotalPrice) %>
    	</td>
    	<td>
    	+2,500원
    	</td>
    	<td>
    	<%=df.format(cartTotalPrice2) %>
    	</td>
    </tr>
    <tr>	
    	<td colspan=2>
    	
    		<a href="mall_calculate.jsp"><font color="black">[결제하기]</font></a>
    		<a href="mall.jsp"><font color="black">[계속쇼핑]</font></a>
    		       
    	</td>
    </tr>	
    
    <%
    }//else
    %>
    </table>
<%@include file="mall_bottom.jsp" %>
