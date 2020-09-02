<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- myshop\display\mall.jsp<br><br>  -->
mall.jsp
<%@ include file="mall_top.jsp"%>

<style type="text/css">
.logout {
	float: right;
}

#imgsrc {
	width: "100%";
	height: 70%;
	align: "center";
}
</style>

<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">

$(function(){
	imsi = $('.small:eq(0)').attr('src');
	$('#area img').attr('src',imsi);
	
	$('img.small').mouseover(function(){
		$(this).fadeTo('slow',0.3);
		$('#area img').css('display','none');
		$('#area img').attr('src', $(this).attr('src'))
					.fadeIn(2000); 
	});
	  
	$('img.small').mouseout(function(){
		$(this).fadeTo('fast',1);
	});
	 
			 
});
function spec(){
	
}
		
	
	</script>

<tr>
	<td align="center" colspan="2">
		<table width="100%">
			<tr>
				<td align="center">
					<div id="area">
						<img id="imgsrc">
					</div>
			</tr>
			</td>

			<tr>
				<td align="center">
					<div>
						<img src="<%=contextPath%>/img/man.png" width='50' height='30'
							align="center" class="small"> <img
							src="<%=contextPath%>/img/man2.png" width='50' height='30'
							align="center" class="small"> <img
							src="<%=contextPath%>/img/man3.png" width='50' height='30'
							align="center" class="small">

					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>

<br>
<center>
<tr align="center">
	<td colspan="2">
		<h2>
			<font color="black">WEEKLY BEST</font>
		</h2>
	</td>
</tr>


<%
	ProductDao pdao=ProductDao.getInstance();
	String[] spec={"HIT","NEW","BEST","NORMAL"};
	DecimalFormat df = new DecimalFormat("###,###");
	for(int i=0;i<spec.length;i++){
		ArrayList<ProductBean> plists = pdao.getSelectBySpec(spec[i]);
%>
<tr align="center">
	<td colspan="2"><br>
		<h3>
			<font color="blue"><%=spec[i] %></font>
		</h3> <br></td>
</tr>
<%
		if(plists.size()==0){
		%>
<tr align="center">
	<td colspan="2"><br> <b><font color='black'><%=spec[i]%>상품
				없습니다. </font></b><br> <br> <br></td>
</tr>
<%}      
		else{
				int count = 0;
					%>
					<tr>     
	<td align="center" colspan="2">
		<%
				for(ProductBean pb : plists){
					count++;
					String pimage = pb.getPimage();
					String pname=pb.getPname();
					int price=pb.getPrice();
					int point=pb.getPoint();
					int pnum=pb.getPnum();
					
					String imgPath=request.getContextPath() + "/myshop/images/"+pimage;
					%> <a href="<%=request.getContextPath()%>/myshop/display/mall_prodView.jsp?pnum=<%=pnum%>">
			<span><img src="<%=imgPath%>" width="250" height="300">
	</a>
	 <font color=black><br><%=pname %><br></font>
	  <font color=black><%=df.format(price)%>원 </font><br>
		<font color=black><%=point %>point</font><br></span>
		    
		
		
		  <%                     
					if(count%3==0){ 
						out.println("</tr><tr>"); 
				}//한 줄에 3개씩 보여주기 위해 사용	, //3의 배수대로 한줄 닫고 한줄 열음
					
			
				}%>	</td>        
				</tr><%

	}
	}
	     

%>
</center>
</table>











<%@ include file="mall_bottom.jsp"%>