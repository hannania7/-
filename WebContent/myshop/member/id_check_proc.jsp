<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String userid = request.getParameter("userid");
	MemberDAO dao=MemberDAO.getInstance();
	boolean check = dao.searchID(userid); //있는 아이디인가.체크
	String str="";
	System.out.print("check="+check);
	if(check){ //true
		str="NO";
		out.print(str); //이걸로 
		
	}else{ //false
		str="YES";
		out.print(str);
		
	}
%>
