<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/annonydetail.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	function adetailDel() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "./adetailDel?abno=${detail.abno}";
		}
	}

	function adetailUp() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "./adetailUp?num=${detail.rowNum}";
		}
	}
</script>
<style type="text/css">
.cdel{
 float: right;
}
.cedit {
 float: right;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<%@ include file="sidebar.jsp"%>
	<article id="article">
		<br> 번호 : ${detail.rowNum } <br> 제목 : ${detail.abtitle } <br>
		내용 : ${detail.abcontent }<br> 글쓴이 : ${detail.abwrite } <br>
		날짜 : ${detail.abdate } <br>
		<c:if test="${sessionScope.eno == detail.eno || session.egrade == 8}">
			<button class="adetailUp" onclick="adetailUp()">수정</button>
			<button class="adetailDel" onclick="adetailDel()">삭제</button>
		</c:if>
		<c:if test="${sessionScope.eno ne detail.eno }">
		<button class="abreport">신고</button>
		<div class="reportBox"></div>
		</c:if>	
		<c:choose>
			<c:when test="${count gt 0 }">
				<div class="divTable minimalistBlack">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead">글쓴이</div>
							<div class="divTableHead">내용</div>
						</div>
					</div>
					<c:forEach items="${commentList }" var="row">
						<div class="divTableBody">
							<div class="divTableRow">
								<c:choose>
									<c:when
										test="${row.csecret == 0 && (sessionScope.eno == detail.eno|| sessionScope.eno == row.eno || session.egrade == 8)}">
										<div class="divTableCell">${row.cwrite}<c:if
												test="${row.cself == 0 }">
												<h6 style="color: red; display: inline;">(작성자)</h6>
											</c:if>
										</div>
										<div class="divTableCell">${row.ccomment}
											(비밀댓글입니다.)
											<c:if test="${sessionScope.eno == row.eno }">
												<button class="cdel">삭제</button>
												<button class="cedit">수정</button>
												<input type="hidden" class="cno" value="${row.cno }">
												<input type="hidden" class="comment" value="${row.ccomment}">
											</c:if>
										</div>
									</c:when>
									<c:when
										test="${row.csecret == 0 && (sessionScope.eno != detail.eno && sessionScope.eno != row.eno)}">
										<div class="divTableCell">비밀댓글입니다.</div>
									</c:when>
									<c:when test="${row.csecret == 1 }">
										<div class="divTableCell">${row.cwrite}<c:if
												test="${row.cself == 0 }">
												<h6 style="color: red; display: inline;">(작성자)</h6>
											</c:if>
										</div>
										<div class="divTableCell">
											${row.ccomment}
											<c:if test="${sessionScope.eno == row.eno }">
												<button class="cdel" >삭제</button>
												<button class="cedit">수정</button>
												<input type="hidden" class="cno" value="${row.cno }">
												<input type="hidden" class="comment" value="${row.ccomment}">
											</c:if>
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
댓글이 없습니다.
</c:otherwise>
		</c:choose>






		<form action="./comment" method="post">
			<input type="text" name="comment" class="commentcontent"
				placeholder="글쓴이 : ${commentWriter }">
			<c:if test="${sessionScope.eno != detail.eno }">
				<input id="secret" type="checkbox" name="secret" value="0" />비밀댓글</c:if>
			<br>
			<button type="submit" class="writeBtn">댓글쓰기</button>
			<input type="hidden" name="writer" value="${commentWriter }"
				class="commentWriter'"> <input type="hidden" name="eno"
				value="${sessionScope.eno }" class="commentEno'"> <input
				type="hidden" name="abno" value="${detail.abno }"
				class="commentAbno'"> <input type="hidden" name="detailEno"
				value="${detail.eno }"> <input type="hidden" name="rowNum"
				value="${detail.rowNum }">
		</form>
	</article>

	
	<script type="text/javascript">
		$(function() {
			$(".writeBtn").click(function(){
				let length = $(".commentcontent").val().length;
				
				if(length < 5 ){
					alert("댓글을 5글자 이상 입력해주세요.");
					return false;
				}
			});
			
			
			
			
			$(".cedit").click(function() {
				//alert("!");
				const cno = $(this).siblings(".cno").val();
				let content = $(this).siblings(".comment").val();
				let abno = ${detail.abno};
				let rowNum = ${detail.rowNum};
				// 가져온 값을 알람으로 표시합니다.
				//글씨 상자 만들기
		    	  let recommentBox = '<div class="recommentBox">';
		    	  recommentBox += '<form action = "./cedit" method = "post">';
		    	  recommentBox += '<input type="text" id = "rcta" name = "comment" placeholder="댓글을 입력하세요" value = '+content+'></input>';
		    	  recommentBox += '<input type = "hidden" id="abno" name = "abno" value = "'+abno+'">';
		    	  recommentBox += '<input type = "hidden" id="cno" name = "cno" value = "'+cno+'">';
		    	  recommentBox += '<input type = "hidden" id="rowNum" name = "rowNum" value = "'+rowNum+'">';
		    	  recommentBox += '<button type="submit" id="recomment">댓글수정하기</button>';
		    	 recommentBox += '</form>';
		    	  recommentBox += '</div>';
				
		    	  //내 위치 찾기
				let location = $(this).parent(".divTableCell");
		    	  location.after(recommentBox);
		    	  location.remove();
			});//cedit 끝
			$(".cdel").click(function(){
				const cno = $(this).siblings(".cno").val();
				let content = $(this).siblings(".comment").val();
				let abno = ${detail.abno};
				let rowNum = ${detail.rowNum};
				
				if(confirm("댓글을 삭제하시겠습니까?")){
					$.ajax({
						url : "/cdel",
						type : "post",
						data : {cno : cno, abno : abno},
						dataType : "json",
						success: function(data){
							
						
							alert("댓글이 삭제되었습니다.");
							window.location.href = '/annonyDetail?num='+rowNum;
						},
						error : function(error){
							alert("ㅠㅠ");
						}
						
						
					});
				}
				
				
			});//cdel 끝
			

				 $(".abreport").click(function() {
					 
					 let reportBox = $(".reportBox");

					 reportBox.empty();
					  
					 window.open('./report?num='+${detail.rowNum}, '신고하기',"width=650px, height = 550px scrollbars=yes");

							

					  });//신고 버튼 클릭 끝
			
			
		});
	</script>

</body>
</html>