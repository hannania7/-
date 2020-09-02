<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwdPro.jsp <br><br>


<%
	request.setCharacterEncoding("UTF-8"); 
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String msg="",url="";
   
	MemberDAO mdao=MemberDAO.getInstance();
	MemberDTO mdto = mdao.getMemberByIdAndName(id,name,email);     
	           
	if(mdto != null){                           
		msg = mdto.getPassword();  
		
	}else{
		msg = "없는 회원";
	}
		url="main.jsp"; 
	
%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다");
location.href="<%=url%>"; 

</script>
