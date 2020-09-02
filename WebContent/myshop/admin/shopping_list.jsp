<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.mall.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- myshop/admin/main.jsp -->
<br>
<br>


<%@ include file="top.jsp"%>
<jsp:useBean id="order" class="my.shop.mall.OrdersDao" scope="session"/>
	<%
	Vector<OrdersBean> lists=new Vector<OrdersBean>();
	DecimalFormat df=new DecimalFormat("###,###"); 
		String memid=request.getParameter("memid");
		int total=0;
		if(memid!=null){ //id입력하고 내역조회 눌렀을 때,
			lists=order.getOrderList(memid);
		}
		
	%>	    
<td colspan="6" valign="top">
	<form action="shopping_list.jsp" method="post">
	<table border="1" width="800px">
		<tr>
			<td colspan="5" align="center">
					조회할 회원 아이디 입력:<input type="text" name="memid" value="hong">
									<input type="submit" value="내역 조회">
				
			</td>
		</tr>

		<tr bgcolor="#D5D5D5">
			<th>고객명</th>
			<th>아이디</th>
			<th>상품명</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
		
		<!-- for문 들어갈 자리 -->
		<%
		
		for(OrdersBean bean : lists){%>
		<tr>
			<td align="center"><%=bean.getMname()%></td>		
			<td align="center"><%=bean.getMid()%></td>		
			<td align="center"><%=bean.getPname()%></td>		
			<td align="center"><%=bean.getQty()%></td>		
			<td align="center"><%=df.format(bean.getAmount())%></td>		
		</tr>	    
		<%  
		
		total += bean.getAmount();
		%>
		<%}//for
		%>        
		
		<tr>
			<td colspan="4" align="center">총합</td>
			<td align="right">￦<%=total %></td>
		</tr>
	</table>
	</form>
</td>

<%@ include file="bottom.jsp"%>
