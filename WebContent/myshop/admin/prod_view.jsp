<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="top.jsp"%>

	<%ProductDao dao=ProductDao.getInstance();
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	
	ArrayList<ProductBean> lists=dao.getOneProduct(pnum);
	%>  
	<td colspan ="6" valign="top">
	<form name="myform" action="prod_list.jsp">
	<table class=outline width="600">
	<caption align="top"><b>상품상세보기</b></caption>
	<%if(lists.size()==0){%>
				<tr>
				<td colspan="8" align="center">등록된 카테고리 없습니다.</td>
				</tr>
				<%}%>
	
	<tr>
		<th width="15%" class=m2>카테고리</th>
		<td width="35%"><%=lists.get(0).getPcategory_fk() %></td>
		<th width="15%" class=m2>상품번호</th>
		<td width="35%"><%=lists.get(0).getPnum() %></td>
	</tr> 
	
	<tr>
		<th width="15%" class=m2>상품명</th>
		<td width="35%"><%=lists.get(0).getPname() %></td>
		<th width="15%" class=m2>제조회사</th>
		<td width="35%"><%=lists.get(0).getPcompany() %></td>
	</tr>
	<%String conpath2=request.getContextPath() + "/myshop/images/" + lists.get(0).getPimage(); %>
	<tr>
		<th width="15%" class=m2>상품이미지</th>
		<td colspan="3" align="center"><img src="<%=conpath2%>" width="30" height="30"></td>
				
	</tr>
	
	<tr>
		<th width="15%" class=m2>상품 수량</th>
		<td width="35%"><%=lists.get(0).getPqty() %></td>
		<th width="15%" class=m2>상품 가격</th>
		<td width="35%"><%=lists.get(0).getPrice() %></td>
	</tr>
	
	<tr>
		<th width="15%" class=m2>상품 스펙</th>
		<td width="35%"><%=lists.get(0).getPspec() %></td>
		<th width="15%" class=m2>상품 포인트</th>
		<td width="35%"><%=lists.get(0).getPoint() %></td>
	</tr>
	
	<tr>
	<th width="15%" class=m2>상품 소개</th>
	<td><textarea rows="5" cols="50" style="resize:none"><%=lists.get(0).getPoint() %></textarea></td>
	</tr>
	
	<tr>
		
		<td colspan="4" align="center" class="m1">
			<input type="submit" value="돌아가기">
		</td>
		
	</tr>

	
	
	</table>
	</form>
	</td>
	
<%@ include file="bottom.jsp"%>

