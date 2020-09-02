<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- mall.cgList.jsp  -->
mall.cgList.jsp
<%@include file="mall_top.jsp"%>
</table>
<%request.setCharacterEncoding("UTF-8");
	String cgname=request.getParameter("cgname");
	String code=request.getParameter("code");
	System.out.println(cgname +"," + code);
	/* pcategory_fk = code + pcode; */
	DecimalFormat df = new DecimalFormat("###,###");
	
	
	ProductDao pdao=ProductDao.getInstance();
	
	
	ArrayList<ProductBean> plists=pdao.getSelectByCategory(code); 
	  
	%>
	
	<br>
	<div align="center"><font color="black" style="font-weight: bold;"><%=cgname %></font></div>
	<br>
	 
	 <%
	 if(lists.size()==0){
			out.println("<tr><td>상품은 없습니다.</td></tr>");
		}
		else{
	 %>
		<table align="center" width="100%">
		
		<tr>
		<%	
			int count = 0;
			for(ProductBean pb : plists){
				count++;
				String pimage = pb.getPimage();
				String pname=pb.getPname();
				int price=pb.getPrice();
				int point=pb.getPoint();
				int pnum=pb.getPnum();
				
				String imgPath=request.getContextPath() + "/myshop/images/"+pimage;
				%>
					<td align="center">
						<a href="<%=request.getContextPath()%>/myshop/display/mall_prodView.jsp?pnum=<%=pnum%>"><img src="<%=imgPath%>" width="250" height="300"></a><br>
						<font color="black"><%=pname %></font><br>
						<font color="black"><%=df.format(price)%> 원</font><br>        
						<font color="black"><%=point %>point</font><br>							
					</td>     
				<%                     
				if(count%3==0){ 
					out.println("</tr><tr>"); 
				}
			}//한 줄에 3개씩 보여주기 위해 사용	, //3의 배수대로 한줄 닫고 한줄 열음
		%>
		</tr>
	<%
		}


%>
		
	</table>


<%@include file="mall_bottom.jsp"%>