<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_input_proc.jsp <br><br> -->

<%


ServletContext sc=config.getServletContext(); //getServleyContext는 jsp업로드 경로를 불러온다.
String uploadDir=sc.getRealPath("/myshop/images");
//C:\JSP_wtc\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\myshop\images
int maxSize = 1024 * 1024 * 5;
String encType="UTF-8";
MultipartRequest mr = null;
mr = new MultipartRequest(request,uploadDir,maxSize,encType,new DefaultFileRenamePolicy());
          
String pn=mr.getParameter("pname");
System.out.print("pn="+pn);

String pimage2=mr.getParameter("pimage");
System.out.print("pimage2="+pimage2); 

String pimage = mr.getFilesystemName("pimage");
System.out.print("pimage="+pimage);
ProductDao pdao = ProductDao.getInstance();
int cnt=pdao.insertProduct(mr);
String msg="",url="";
if(cnt>0){
	msg="상품 등록 성공";
	url ="prod_list.jsp";
}
else{
	msg="상품 등록 실패";
	url ="prod_input.jsp";
} 

%>  
<script type="text/javascript">
alert("<%=msg%>"+"입니다");
location.href="<%=url%>";
</script> 
