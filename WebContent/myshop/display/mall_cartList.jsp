<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartList.jsp -->
mall_cartList.jsp
    <%@ include file="mall_top.jsp"%>
    
    <jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
    
    <%
    DecimalFormat df=new DecimalFormat("###,###");
    int cartTotalPrice=0;
    int cartTotalPoint=0;
    %>
    
    <table width="100%">
    <tr width="100%">
    	<th colspan="8">장바구니<br><br></th>
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
					<input type="text" name="oqty" value="<%=pb.getPqty() %>" size="1">개<br>
						<input type="hidden" name="pnum" value="<%=pb.getPnum() %>">   	
	    			<input type="submit" value="변경">
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
    	
    		<a href="mall_order.jsp?pnum=<%=00%>&oqty=<%=00%>"><font color="black">[전체상품주문]</font></a>
    		<a href="mall.jsp"><font color="black">[계속쇼핑]</font></a>
    		       
    	</td>
    </tr>	
    
    <%
    }//else
    %>
    </table>

    <%@ include file="mall_bottom.jsp"%>