<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int maxSize = 1024 * 1024 * 5;
String encType="UTF-8";


ServletContext sc=config.getServletContext(); //getServleyContext는 jsp업로드 경로를 불러온다.
String configFolder=sc.getRealPath("/myshop/images");
MultipartRequest mr = null;
mr = new MultipartRequest(request,configFolder,maxSize,encType,new DefaultFileRenamePolicy());


String old_pimage=mr.getParameter("old_pimage"); //기존이미지.jpg
System.out.print("old_pimage="+old_pimage);
String pimage2=mr.getFilesystemName("pimage");

File dir=new File(configFolder); //dir는 폴더 경로 file은 파일을 폴더로 바꿈


if(pimage2!=null){ //파일을 새로 선택한 것이 있다면
	if(old_pimage!=null){ //기존 이미지도 있다면
		File delFile = new File(dir,old_pimage);
	
		if(delFile.exists()){ //dir의 폴더에 old_pimage 파일이 존재하면,
			if(delFile.delete()){ //지워라
				%>
				<script type="text/javascript">
				alert("이미지 파일 삭제 성공");
				</script>
				<%
			}
		}
	}
}




ProductDao pdao=ProductDao.getInstance();
int cnt=pdao.getUpdateProduct(mr);
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
