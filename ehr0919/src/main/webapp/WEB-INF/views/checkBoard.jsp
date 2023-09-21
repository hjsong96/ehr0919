<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/admin.css">
<style type="text/css">
.notice-write-form{
	width: 95%;
	height: auto;
	margin : 10px;
	padding: 20px;
	box-sizing: border-box;
}
.notice-write-form input{
	height: 30px;
	width: 100%;	
}
.notice-write-form textarea {
	width: 100%;
	height: 300px;
	margin: 5px 0px;
}
.notice-write-form button {
	width: 100px;
	height: 50px;
}
table{
	width: 800px;
	text-align: center;
	border-collapse: collapse;
	float: left;
}
tr{
	border-bottom: 1px solid silver;
}
tr:hover{
	background-color: silver;
}
.title{
	text-align: left;
	width: 40%;
}

.content-view{
	width: calc(100% - 1000px);
	height: 500px;
	background-color: beige;
	float: right;
	margin-right: 100px;
}
</style>
<script type="text/javascript">
   $(function() {
      //alert("!");
      $(".reportDetail").click(function() {
        
        
         let abno = $(this).children(".abno").text();
         $.ajax({
        	 url: "./reportDetail",
        	 type: "post",
        	 data: {abno: abno},
        	 dataType: "json",
        	 success:function(data){
        		 //alert(data.content);
        		 $(".content-view").html("<h3> 제목 : "+data.detail.abtitle+"</h3>");	
        	 },
        	 error:function(data){
        		 alert("오류가 발생했습니다. 다시 시도하지 마십시오 : " + data);
        	 }
         });
      });//상세보기 끝
      
      $(".agree").click(function(){
    	  if(confirm("동일한 게시글에 대한 신고는 일괄 처리됩니다.\n신고를 승인하시겠습니까?")){
    		  let abno = $(this).parents().siblings(".abno").text();
			  let rreported = $(this).siblings(".rreported").val();
    		  $.ajax({
    			  url : "./reportAgree",
    			  type : "post",
    			  data : {abno:abno, rreported:rreported},
    			  dataType : "json",
    			  success : function(data){
    				  alert("승인이 완료되었습니다.");
    				  window.location.href = '/checkBoard';
    			  },
    			  error : function(error){
    				  alert("ㅠㅠ");
    			}
    			  
    			  
    		  });//ajax 끝 
    	  }
      });//승인 눌렀을 때 끝
      
      $(".reject").click(function(){
    	  if(confirm("동일한 게시글에 대한 신고는 일괄 처리됩니다.\n신고를 거절하시겠습니까?")){
    		  let abno = $(this).parents().siblings(".abno").text();
    		  $.ajax({
    			  url : "./reportReject",
    			  type : "post",
    			  data : {abno:abno},
    			  dataType : "json",
    			  success : function(data){
    				  alert("거절이 완료되었습니다.");
    				  window.location.href = '/checkBoard';
    			  },
    			  error : function(error){
    				  alert("ㅠㅠ");
    			}
    			  
    			  
    		  });//ajax 끝 
    	  }
		  
      });

      
      
      
      
      
     
   });
</script>
</head>
<body>
	<div class="container">
		<div class="main">
			<div class="article">			
				<h1>관리자 - 신고 관리 게시판</h1>
				<table>
					<tr>
						<td>게시판 번호</td>
						<td>날짜</td>
						<td>신고 내용</td>
						<td>신고 상세설명</td>
						<td>처리 유무</td>
					</tr>
					<c:forEach items="${list}" var="row">
					<tr class="reportDetail">
						<td class="abno">${row.abno }</td>
						<td>${row.rdate }</td>
						<td>${row.rcontent }</td>
						<td>${row.rdetail }</td>
						<td>
						<button class="agree">승인</button><button class="reject">거절</button>
						
						<input class="rno" type="hidden" value="${row.rno}"/>
						<input class="rreported" type="hidden" value="${row.rreported }"/>
						</td>
					</tr>						
					</c:forEach>
				</table>
				<div class="content-view">
					<div>
					
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>