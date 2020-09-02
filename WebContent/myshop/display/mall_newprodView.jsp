<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_newprodView.jsp <br><br> -->
mall_newprodView.jsp
<script type="text/javascript">
	function goCart(pnum){
		oqty=document.f.oqty.value;
		if(oqty < 1){
		alert("1보다 큰 수를 입력하세요");
		return;
		}
	location.href="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
	}       
	function goOrder(pnum){
		//alert("goOrder");
		document.f.action="<%=request.getContextPath()%>/myshop/display/mall_order.jsp?pnum="+pnum;
		document.f.submit();
	}
</script>
<%@include file="mall_top.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
application.setAttribute("flag", true); // flag = true
System.out.println("mall_prodview.jsp flag:" + application.getAttribute("flag"));
int pnum=Integer.parseInt(request.getParameter("pnum"));
DecimalFormat df = new DecimalFormat("###,###");
ProductDao pdao=ProductDao.getInstance();
ArrayList<ProductBean> lists2=pdao.getOneProduct(pnum);     
%>
<table border="0" width="100%">
	<tr class="m1">
		<th colspan="2"><font color="green" size="3">[<%=lists2.get(0).getPname() %>]상품정보</font></th>
	</tr>
	<tr align="center">	
		<td class="m3">       
		<img src="<%=request.getContextPath()%>/myshop/images/<%=lists2.get(0).getPimage()%>" colspan="2" width="200" height="200">
		</td>
		<td align="center" class="m3">
			<form name="f" method="post">
				상품번호 : <%=lists2.get(0).getPnum() %> <br>
				상품이름 : <%=lists2.get(0).getPname() %> <br>
				상품가격 : <font color="red"><%=df.format(lists2.get(0).getPrice()) %></font>원 <br>
				상품포인트 : <font color="red">[<%=lists2.get(0).getPoint() %>]</font>point <br>
				상품갯수 : <input type="text" name="oqty" value="1" size="2">개 <br><br>
				<table width="90%" align="center">
					<tr>
						<td>
							<a href="javascript:goCart(<%=pnum %>)">
								<img src="../images/cartbtn.gif" width="90" height="35">
							</a>
						</td>
						
						<td>
							<a href="javascript:goOrder(<%=pnum %>)">
								<img src="../images/orderbtn.gif" width="90" height="35">
							</a>
						</td>
					</tr>	
				</table>
				</form>
			</td>
	</tr>            
	<tr height="200" valign="top">	
		<td colspan="2">
			<b>상품 상세 설명</b><br>
			<%=lists2.get(0).getPcontents() %>
		</td>
	</tr>

</table>
<%@include file="mall_bottom.jsp"%>