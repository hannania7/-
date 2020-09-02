<%@page import="java.util.ArrayList"%>
<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css">

<style type="text/css">
table {
	border-collapse: collapse;
}
</style>



<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	
	var isCheck = false;
	var isChange = false;
	var use = "";
	


	$(function(){
		
		$('input[name="id"]').keydown(function(){
			$('#idmessage').css('display','none');
			isChange = true;
			use="";
		});
		
		
	});

	function writeSave(){ // 
		if($('input[name="id"]').val()==""){
			alert("id를 입력하세요."); 
			
			return false;
		}
		
		if(use == "impossible"){
			alert("이미 사용중인 아이디입니다");
			
			return false;
		}
		
		if(isCheck == false || isChange == true){
			alert("중복체크 하세요");
			return false; 
		}//isCheck는 중복체크 버튼을 누르고 제출했는 지 여부 isChange는 키보드만 누르고 제출했는 지 여부
		
		
				
		if($('input[name="password"]').val()==""){
			alert("비번을 입력하세요.");
			
			return false;
		}
		
		if(pwsame == "비번불일치"){
			alert("비번 불일치");
			return false;
		}//자바스크립트는 문자열끼리 equals 안 써도 됨
		
	}//writeSave()





	
	  


	function pwcheck(){
		
		
		var password = document.forms[0].password.value; // abc 12a4
		
		var regexp =/^[a-z0-9]{4,16}$/i; //영문대소문자 숫자 4~16자리
		
		if(!regexp.test($('input[name="password"]').val())){  //내가 적은 패스워드가 정규표현식에 성립하는가?
			$('#pwmessage1').html('<font color=red>영문 대소문자/숫자 4자~16자로 입력해주세요.</font>');
			$('#pwmessage1').show(); 
			return false;
		}
		else if(regexp.test($('input[name="password"]').val())){
			$('#pwmessage1').html('<font color=red>비밀번호 형식이 맞습니다.</font>');
			$('#pwmessage1').show();
		}
		
		
		
		//test() : true, false리턴 
		//search() : 위치를 리턴 , 못찾으면 -1리턴
		
	}
	


	function duplicate(){ //  
		//alert("1");
		
		


		isCheck = true;
		isChange = false;
		
		
	
		
		$.ajax({
			url : "id_check_proc.jsp",
			data : ({
					userid:$('input[name="id"]').val() // userid=kim
			}),
			success : function(data){
				


				var id = document.forms[0].id.value; // abc 12a4
				
											           
				if($('input[name="id"]').val() == ""){
					$('#idmessage').html('<font color=red>아이디를 입력해주세요</font>');
					$('#idmessage').show(); 
					return false;
					
					 
				}
				else if($.trim(data) == 'YES'){
					$('#idmessage').html('<font color=red>사용 가능합니다.</font>');
					$('#idmessage').show();
					use = "possible";
				}
				else{
					$('#idmessage').html('<font color=red>이미 사용중인 아이디입니다.</font>');
					$('#idmessage').show();
					use = "impossible";  
					return false;
				}
				
				
			}
		}); // ajax
		
	} // Idcheck
	
	function Check(){
		if($('input[name="id"]').val()==""){
			alert("아이디 누락");
			return false;
		}
		if($('input[name="password"]').val()==""){
			alert("비밀번호 누락");
			return false;
		}
		if($('input[name="email"]').val()==$('input[name="repassword"]').val()){
			alert("비밀번호와 비밀번호 확인이 같지 않습니다.");
			return false;
		}
		
		if($('input[name="name"]').val()==""){
			alert("이름 누락");
			return false;
		}
		
		if($('select option:selected').val() =="선택"){
			alert("지역번호를 선택하세요");
			return false;
		}
		
		hp2 = $('input[name="hp2"]').val(); // abc
		
		if(hp2 == ""){
			alert("핸드폰 번호 누락");
			return false;
		}
		
		if(isNaN(hp2)){ 
			alert("핸드폰 번호는 숫자로 입력하세요");
			return false;
		}
		
		
		hp3= $('input[name="hp3"]').val(); // abc
		
		if(hp3 == ""){
			alert("핸드폰 번호 누락");
			return false;
		}
		
		if(isNaN(hp3)){ 
			alert("핸드폰 번호는 숫자로 입력하세요");
			return false;
		}
	
		
		
		if($('input[name=email]').val().indexOf('@') == -1){
			alert("email 형식이 맞지 않습니다.");
			return false;
		}
		
		if(!$('input[name=agree]').is(":checked")){
			alert("동의 체크 누락");
			return false;
		}
		
		joindate1 = $('input[name="joindate1"]').val(); // abc
		
		if(joindate1 == ""){
			alert("년도 누락");
			return false;
		}
		
		if(isNaN(joindate1)){ 
			alert("년도는 숫자로 입력하세요");
			return false;
		}
		
		
		joindate2= $('input[name="joindate2"]').val(); // abc
		
		if(joindate2 == ""){
			alert("월 누락");
			return false;
		}
		
		if(isNaN(joindate2)){ 
			alert("월은 숫자로 입력하세요");
			return false;
		}
		
		joindate3= $('input[name="joindate3"]').val(); // abc
		
		if(joindate3 == ""){
			alert("일 누락");
			return false;
		}
		
		if(isNaN(joindate3)){ 
			alert("일은 숫자로 입력하세요");
			return false;
		}
		
		
		
		
		
	}
	</script>
 




<form action="registerPro.jsp" name="myform" method="post"
	onsubmit="return writeSave()">

	<table border="1" frame="void">
		<!-- frame="void"는 테이블 테두리 없애기 -->

		<font size="2"><b>기본 정보</b> </font>
		<br>
		<br>

		<tr>
			<td bgcolor="beige" width="100">아이디<font color="blue">*</font>
			</td>

			<td><input type="text" name="id" id="id_check">
				<button type="button" id="id_check" onclick="return duplicate()">중복체크</button> 
				<span id="idmessage" style="display: none;"></span></td>
		</tr>
		<tr>
			<td bgcolor="beige" width="100">비밀번호<font color="blue">*</font></td>
			<td><input type="password" name="password" id="password"
				onkeyup="return pwcheck()"> (영문 대소문자/숫자 4자~16자)
			
				<span name="pwmessage1" id="pwmessage1"
				style="display: none;">비밀번호 형식이 맞지 않습니다.</span></td>
		</tr>
		<tr>
			<td bgcolor="beige" width="100">비밀번호 확인<font color="blue">*</font></td>
			<td><input type="password" name="repassword" id="repassword"
				> </td>
		</tr>
		<tr>
			<td bgcolor="beige" width="100">이름<font color="blue">*</font></td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td rowspan="3" bgcolor="beige" width="100">주소</td>
			<td><input type="text" name="add1" size="5">
				<button type="button" onclick="return address()">우편번호</button></td>
		</tr>
		<tr>
			<td><input type="text" name="add2" size="40"></td>
		</tr>
		<tr>
			<td><input type="text" name="add3" size="40"></td>
		</tr>

		<tr>
			<td bgcolor="beige" width="100">일반전화</td>
			<td><select name="gp1">
					<option value="02" selected="selected">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
			</select> - <input type="text" name="gp2" size="4" maxlength="4"> - <input
				type="text" name="gp3" size="4" maxlength="4"></td>
		</tr>

		<tr>
			<td bgcolor="beige" width="100">휴대전화<font color="blue">*</font></td>
			<td><select name="hp1">
					<option value="010">010</option>
					<option value="011">011</option>
			</select> - <input type="text" name="hp2" size="4" maxlength="4"> - <input
				type="text" name="hp3" size="4" maxlength="4"></td>
		</tr>
		<tr>
			<td bgcolor="beige" width="100">이메일<font color="blue">*</font>
			</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td bgcolor="beige" width="100">평생회원<font color="blue">*</font></td>
			<td><input type="radio" name="agree">동의함 <input type="radio" name="agree">동의안함<br>
				<font size="0.005px">-평생회원으로 가입하시면 바이모노 회원 탈퇴시까지는 휴면회원으로 전환되지
					않으며, 고객님의 개인정보가 탈퇴시까지 안전하게 보관됩니다.<br> -지금 평생회원으로 가입하시면 3,000원
					쿠폰을 드립니다. (쿠폰혜택을 받으신 경우, 3개월간 평생회원을 유지하셔야 합니다.)
			</font></td>
	</table>
	<br>
	<table border="1" frame="void" width="100%">
		<!-- frame="void"는 테이블 테두리 없애기 -->
		<font size="2"><b>추가정보</b> </font>
		<br>
		<br>
		<tr>
			<td bgcolor="beige" width="100">생년월일<font color="blue">*</font>
			<td><input type="text" name="joindate1" size="3">년 <input
				type="text" name="joindate2" size="1">월 <input type="text"
				name="joindate3" size="1">일</td>
		</tr>
		<br>



		<tr>
			<td colspan="2" align="center"><input type="submit" value="회원가입"
				id="sub" onClick="return Check()">&nbsp;&nbsp;</td>
		</tr>
	</table>
</form>