<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">
body{
margin: 100px;
}
</style>
</head>
<body style="text-align: center;">
<h2 style="text-align: center;">신고하기</h2>
				<div>
				신고 사유를 선택해주세요.
				</div>	
				<div>
					 <select class="rcontent" style="float: left; width: 459px;">
					  <option value='선정적인 내용'>선정적인 내용</option>
					 <option value='욕설 및 비방'>욕설 및 비방</option>
					    <option value='기타'>기타</option>
					</select>
				</div> 
				<br>
				<div>
					상세 설명을 입력해주세요.
					  <textarea style="width: 459px; height: 200px; resize: none;" class="rdetail" placeholder="가능한 자세히 상세 설명을 입력해주세요."></textarea>
				</div>   
					 <div><br>허위 신고 시 제재당할 수 있으며<br>
					 사원정보가 관리자에게 공개될 수 있는 것에 동의하십니까?</div>
						동의합니다.<input id='agree' type='checkBox'/>
					  <div style="">
					   <input class='rebtn' type="submit" value="신고하기"/>
					   <input class="close" type="submit" value="닫기">
					   </div>
<script type="text/javascript">
$(function(){
	$(".rebtn").click(function(){
		//alert(${sessionScope.eno});
		let rdetail = $(".rdetail").val();
		let rcontent = $(".rcontent").val();
		let reporter = ${sessionScope.eno};
		let reported = ${detail.eno};
		let abno = ${detail.abno};
		let rowNum = ${detail.rowNum};
		if(rdetail.length < 5){
			alert("상세설명을 5글자 이상 입력해주세요.");
			$(".rdetail").focus();
			return false;
		}
		if(!$("#agree").prop("checked")){
			alert("동의하지 않으면 신고하실 수 없습니다.");
			return false;
		}
		$.ajax({
			url : "./report",
			type : "post",
			data : {rcontent : rcontent, rdetail : rdetail, reporter:reporter,reported,reported, abno:abno},
			dataType : "json",
			success : function(data){
				console.log(data.result);
				console.log(typeof data.result);
				if(data.result === 1){
					
				alert("신고가 정상적으로 완료되었습니다.");
				
				window.close();
				}else{
					alert("왜 안됨 ㅠㅠ");
				}
			},
			error : function(error){
				alert("ㅜㅠ");
				
			}
		});
		
	});//제출 버튼 클릭 끝
	$(".close").click(function(){
		//alert("!");
		window.close(); // 현재 팝업 창을 닫습니다.
	});
});

</script>
</body>
</html>