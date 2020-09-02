<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findidPro.jsp <br><br>

<%
	request.setCharacterEncoding("UTF-8"); 
	String name=request.getParameter("name");
	String email=request.getParameter("email"); //getParameter나 setProperty는 선택임
	String msg="",url="";

	MemberDAO mdao=MemberDAO.getInstance();
	MemberDTO mdto = mdao.getMemberByrrn(name,email); //모두 일치하는 레코드가 있나 확인
	
	if(mdto != null){         
		msg = mdto.getId(); //찾으면 id알려줌
		
	}else{
		msg = "없는 회원";
	}
		url="main.jsp"; 
	
%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다");
location.href="<%=url%>"; 

</script>
