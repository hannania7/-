<%@page import="java.io.File"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">    
<%@ include file="top.jsp" %>
<!-- prod_update.jsp<br><br> -->

<% request.setCharacterEncoding("UTF-8");
int pnum=Integer.parseInt(request.getParameter("pnum"));
ProductDao pdao=ProductDao.getInstance();
ArrayList<ProductBean> lists=pdao.getOneProduct(pnum);
%>
<td colspan="6" align=center valign=top>
<form name="myform" action="prod_update_proc.jsp" method="post" enctype="multipart/form-data">
<table width=600 class=outline>
	<tr>
		<th class=m2>카테고리</th>
		<td><input type="text" name="pcategory_fk" value="<%=lists.get(0).getPcategory_fk() %>" disabled></td>
		<td><input type="hidden" name="pcategory_fk" value="<%=lists.get(0).getPcategory_fk() %>"></td>
	</tr>
	
	<tr>
		<th class=m2>상품번호</th>
		<td><%=lists.get(0).getPnum() %></td>
		<td><input type="hidden" name="pnum" value="<%=lists.get(0).getPnum() %>"></td>
	</tr>
	
	<tr>
		<th class=m2>상품명</th>
		<td><input type="text" name="pname" value="<%=lists.get(0).getPname() %>"></td>
	</tr>
	
	<tr>
		<th class=m2>제조회사</th>
		<td><input type="text" name="pcompany" value="<%=lists.get(0).getPcompany() %>"></td>
	</tr>
	
	<%String conpath2=request.getContextPath() + "/myshop/images/" + lists.get(0).getPimage();%>
	<%String configFolder=config.getServletContext().getRealPath("/myshop/images/"); %>
	<tr>        
		<th class=m2>상품이미지</th>
		
		<td align=left>
		<img src="<%=conpath2%>" width="40" height="40">
		
		<input type="file" name="pimage"> <!-- 새 이미지 담길 장소 -->
		
		<%
		if(lists.get(0).getPimage() != null){ //DB테이블에 있다면
			File existFile=new File(configFolder,lists.get(0).getPimage());
			if(existFile.exists()){// 웹서버 폴더에 기존 이미지가 있다면
		%>
		<input type="text" name="old_pimage" value="<%=lists.get(0).getPimage()%>"> <!-- old_pimage=이전 이미지.jpg -->
		
		<%	
			}else{//DB테이블에 없고 웹서버 폴더에 없다면,
				pdao.updatePimage(pnum); // pnum에 해당하는 이미지만 pimage = null    
			}       
				
		}
		%>
		
		</td>      
	</tr>                      
	
	<tr>
		<th class=m2>상품 수량</th>
		<td><input type="text" name="pqty" value="<%=lists.get(0).getPqty() %>"></td>
	</tr>
	
	<tr>
		<th class=m2>상품 가격</th>
		<td><input type="text" name="price" value="<%=lists.get(0).getPrice() %>"></td>
	</tr>
	
	<tr>
		<th class="m2">상품 스펙</th>
		<td align=left>
			<select name="pspec">
				<option value="NORMAL" <% if(lists.get(0).getPspec().equals("NORMAL")) {%> selected <% } %>>::NORMAL::</option>
				<option value="HIT" <% if(lists.get(0).getPspec().equals("HIT")) {%> selected <% } %>> ::HIT::</option>
				<option value="NEW" <% if(lists.get(0).getPspec().equals("NEW")) {%> selected <% } %>> ::NEW::</option>
				<option value="BEST" <% if(lists.get(0).getPspec().equals("BEST")) {%> selected <% } %>> ::BEST::</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th class=m2>상품 소개</th>
		<td><textarea rows="5" cols="50" name="pcontents" style="resize: none;"> <%=lists.get(0).getPcontents() %></textarea></td>
	</tr>
	
	<tr>
				<th class="m2">상품 포인트</th>
				<td><input type="text" name="point" value="<%=lists.get(0).getPoint() %>"></td>
			</tr>
	 
	<tr>	
		<td colspan=2 class="m1">
			<input type=submit value="상품 수정">
			<input type=reset value="취 소">
		</td>
	</tr>
</table>
</form>
</td>
<%@ include file="bottom.jsp" %>  
