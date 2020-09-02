

<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
function checkDel(pnum,pimage){ // 2,남성정장.jpg
	var answer = confirm("정말 삭제하시겠습니까?"); //answer는 확인 누르면 true 취소 누르면 false
	if(answer){
		location.href = "prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
	}           
}



</script>
<!-- myshop/admin/main.jsp<br><br> -->

<%@ include file="top.jsp"%>
    


	<td colspan ="6">
		<table width="95%" class=outline>
			<caption align="top"><b>상품목록</b></caption>
			<tr bgcolor="yellow">
				<th class=m2>번호</th>
				<th class=m2>상품코드</th>			
				<th class=m2>상품명</th>			
				<th class=m2>이미지</th>			
				<th class=m2>가격</th>			
				<th class=m2>제조사</th>			
				<th class=m2>수량</th>			
				<th class=m2>수정|삭제</th>			
			</tr>    
			<%
			ProductDao cdao=ProductDao.getInstance(); 
			ArrayList<ProductBean> lists=cdao.getAllProduct(); //ArrayList는 개수가 확실하지 않을 때 사용 bean는 개수가 확실할 때 사용
			if(lists.size()==0){%>
				<tr>
				<td colspan="8" align="center">등록된 카테고리 없습니다.</td>
				</tr>
				<% 
			}
			for(ProductBean pb:lists){
			%>
			<tr>
				<td><%=pb.getPnum() %></td>
				<td align="center"><%=pb.getPcategory_fk() %></td>
				<%System.out.println("카테고리:"+pb.getPcategory_fk());%> 
				<td align="center"><%=pb.getPname() %></td> 
				<%
				pb.getPimage();//남성정장.jpg
				String conpath = request.getContextPath();
				System.out.println("conpath:"+conpath); // /Minimall
				
				String conpath2=request.getContextPath() + "/myshop/images/" + pb.getPimage();
				System.out.println("conpath2:"+conpath2);
				// /Minimall/img/남성정장.jpg
				%>
				<td>
				<a href="prod_view.jsp?pnum=<%=pb.getPnum()%>">
				<img src="<%=conpath2%>" width="40" height="40">
				</a>
				</td>
				
				<td align="center"><%=pb.getPrice()%></td>
				<td align="center"><%=pb.getPcompany()%></td>
				<td align="center"><%=pb.getPqty()%></td>
				<td align="center">
				<a href="prod_update.jsp?pnum=<%=pb.getPnum() %>">수정</a>
				<a href="javascript:checkDel('<%=pb.getPnum()%>' , '<%=pb.getPimage()%>')">삭제</a>
				</td>  
			</tr>    
			
			<%	
			}//for
			
			%>
			
		
		</table>
	</td>
	
<%@ include file="bottom.jsp"%>


	