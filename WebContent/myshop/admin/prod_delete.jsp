<%@page import="java.io.File"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ProductDao pdao=ProductDao.getInstance();
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	String pimage=request.getParameter("pimage");
	System.out.println("pnum:"+pnum);
	System.out.println("pimage:"+pimage);
	
	ServletContext sc=config.getServletContext(); //getServleyContext는 jsp업로드 경로를 불러온다.
	String delPath=sc.getRealPath("/myshop/images");
	//C:\JSP_wtc\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\myshop\images
	
	File dir = new File(delPath);
	File delFile = new File(dir, pimage);
	
	if(delFile.exists()){ 
		if(delFile.delete()){
			%>
			<script type="text/javascript">
			alert("이미지 파일 삭제 성공");
			
			</script>
			
			<%
		}
	}//delFile이 존재하면 true, delFile이 삭제되면 true
	
	
	
	
	int cnt=pdao.deleteProduct(pnum);
	String msg="",url="";
	if(cnt > 0){
		msg = "상품 삭제 성공";
	}
	else{
		msg = "상품 삭제 실패";  
	}
	url = "prod_list.jsp";
%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다");
location.href="<%=url%>";
</script>