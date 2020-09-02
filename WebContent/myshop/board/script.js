$(function(){
	
});

function writeSave(){
	if($('input[name="writer"]').val()==""){
		alert("제목 누락");
		return false;
	}
	if($('input[name="subject"]').val()==""){
		alert("제목 누락");
		return false;
	}
	if($('input[name="email"]').val()==""){
		alert("제목 누락");
		return false;
	}
	if($('#abc').val() == ""){
		alert("제목 누락");




	}
	if($('input[name="passwd"]').val()==""){
		alert("제목 누락");
		return false;
	}
}
