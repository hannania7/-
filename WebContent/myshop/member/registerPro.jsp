
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
myshop\member\registerPro.jsp <br><br>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mbean" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mbean"/>
<%
	
	MemberDAO mdao=MemberDAO.getInstance();
	int cnt=mdao.insertData(mbean);
	String msg="", url="";
	if(cnt>0){
		msg="가입 성공";
		url ="../../main.jsp";
	}
	else{
		msg="가입 실패";
		url = "register.jsp";
	}
	
	
%>
<script type="text/javascript">
alert("<%=msg%>"+"했습니다.");
location.href="<%=url%>";
</script>


