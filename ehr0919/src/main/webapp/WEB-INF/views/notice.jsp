<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
    <script src="./js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="../css/notice.css"> 

</head>

<body>
	 <%@ include file="nav.jsp"%> 
	<%@ include file="sidebar.jsp"%>  
 <article id="article">
 <br>	
 <div class="atList">
       <h1 class="title">공지사항</h1>
       <c:choose><c:when test="${fn:length(list) gt 0 }">
             <div class="atList2">
             <div class="div-btn">
             <c:if test="${sessionScope.eid ne null && sessionScope.egrade eq 8}">
                <button type="button" class="viewBtn" onclick="location.href='./noticeWrite'">글쓰기</button>
             </c:if>
   </div>
                  <table class="table">
                     <thead>
                     <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회수</th>
                     </tr>
                     </thead>
                     <tbody><c:forEach items="${list }" var="row">
                     <tr onclick="location.href='./noticeDetail?nno=${row.nno}'">
                        <td>${row.rowNum}</td>
                        <td>${row.ntitle}</td>
                        <td>${row.ename}</td>
                        <td>${row.ndate}</td>
                        <td>${row.nread}</td>
                     </tr></c:forEach>
                     </tbody>
               </table></div></c:when><c:otherwise>
                     <h1>게시판에 글이 없습니다.</h1></c:otherwise></c:choose>

	</div>
	 <div class="page_wrap">
     <div class="page_nation">
     <div class="page_left_wrap">
      <c:if test="${ph.showPrev}">
            <button class="page_left" onclick="location.href='./notice?page=${ph.startPage-1}'">이전</button>
        </c:if>
        </div>
      <c:forEach var="i" begin="${ph.startPage}" end="${ph.endPage}">
         <a class="num" href="<c:url value='./notice?page=${i}&pageSize=${ph.pageSize}'/>"data-page="${i}">${i}</a>
      </c:forEach>
      <c:if test="${ph.showNext}">
            <button class="page" onclick="location.href='./notice?page=${ph.endPage+1}'">다음</button>
        </c:if>
   </div>
   </div>
	
</article> 
      
</body>
</html>