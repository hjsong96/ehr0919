<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/main.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="./css/style.css">

</head>
<body>
	 <%@ include file="nav.jsp"%> 
	<%@ include file="sidebar.jsp"%>
	<article id="article">
				<div class="flexbox">
					<div class="item"><img src="./upload/${list.eimg}" class="eimg" ><br>
						<div class="nameset7">
							${sessionScope.ename }님<br>
							<a href="./mypage" class="mypage">내정보</a>
						</div>
					</div>
					
						
					<div class="item">	
					<div class="nameset6">
						     <div>출결관리현황</div>
                <br>
                <br>
                <c:out value="출근 : ${list2[list2.size() - 1].atmgstr}" /><br>
                <c:out value="퇴근 : ${list2[list2.size() - 1].atmgend}" /><br>
                <c:choose>

                <c:when test="${list2[list2.size() - 1].atmgsts eq 0}">
                    <div class="sts-img">정상 출근</div>
                </c:when>

                <c:when test="${list2[list2.size() - 1].atmgsts eq 1}">
                    <div class="sts-img">지각</div>
                </c:when>
                
                <c:when test="${list2[list2.size() - 1].atmgsts eq 2}">
                    <div class="sts-img">조퇴</div>
                </c:when>
                
                <c:when test="${list2[list2.size() - 1].atmgsts eq 3}">
                    <div class="sts-img">결근</div>
                </c:when>
                
                <c:otherwise>
                    <div>휴가</div>
                </c:otherwise>
            </c:choose>
         </div>
         </div>

					<div class="item">
						<div class="nameset1">
					신규입사자<br>
				<div class="slideshow-container">

					<div class="mySlides fade">
						<div class="numbertext">1 / 2</div>
						<img class="pic" src="./upload/${newM[0].eimg }"
							style="width: 100px" height="100px"> <br> <br>
						<br>
						<div class="nameset2">
							${newM[0].edept }<br>
						</div>
						<div class="nameset3">
							${newM[0].ename }<br>
						</div>
						<div class="nameset4">${newM[0].ehiredate }입사</div>
					</div>

					<div class="mySlides fade">
						<div class="numbertext">2 / 2</div>
						<img class="pic" src="./upload/${newM[1].eimg }" style="width: 100px"
							height="100px"> <br> <br> <br>
						<div class="nameset2">
							${newM[1].edept }<br>
						</div>
						<div class="nameset3">
							${newM[1].ename }<br>
						</div>
						<div class="nameset4">${newM[1].ehiredate }입사</div>

					</div>
					<br>

					<div style="text-align: center">
						<span class="dot" hidden="hidden"></span> <span class="dot" hidden="hidden"></span>
						<span class="dot" hidden="hidden"></span>
					</div>
				</div>
			</div>
			</div>
</div>
					<div class="item4">
						<div class="nameset5">
							<a href="./notice" class="notice">공지사항</a><br>
							<table>
							 <tbody>
                 				 <tr class="trn">
								    <td class="tdntitle">제목</td>
								    <td class="tdndate">등록일</td>
								</tr>
                     		</tbody>
	 						<tbody>
	                  <c:forEach items="${nlist}" var="i" varStatus="loop">
	                  <c:if test="${loop.index < 5}">
						<tr class="tr1">
							<td><a href="noticeDetail?nno=${i.nno}">${i.ntitle}</a></td>
							<td class="tdndate2">${i.ndate}</td>
						</tr>
					</c:if>
						</c:forEach>
						</tbody>
						</table>

		</div>
	</div>

	</article>
	<script type="text/javascript">
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 4000); // Change image every 2 seconds
		}
		$(function(){
			$(".dot").hide();
			
		});
	</script>
</body>
</html>