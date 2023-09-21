<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div-table{
	margin: 0 auto;
	display: table;
	width: 900px;
	height: auto;
}

.div-row{
	display: table-row;
	height: 30px;
	line-height: 30px;
}

.div-cell{
	display: table-cell;
	border-bottom: 1px solid gray;
	text-align: center;
}
.table-head{
	background-color: gray;
	font-weight: bold;
	text-align: center;
}
</style>

<script type="text/javascript">
function egradeCh(eno, ename, value){

	if(confirm(ename + "님의 등급을 변경하시겠습니까?")){
		location.href="./egradeChange?eno="+eno+"&egrade="+value;
	}

	
}
</script>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<%@ include file="sidebar.jsp"%>
	<article id="article">
				<div class="div-table">
						<div class="div-row table-head">
							<div class="div-cell table-head">사원번호</div>
							<div class="div-cell table-head">이름</div>
							<div class="div-cell table-head">나이</div>
							<div class="div-cell table-head">입사일</div>
							<div class="div-cell table-head">주소</div>
							<div class="div-cell table-head">생년월일</div>
							<div class="div-cell table-head">등급</div>
						</div><c:forEach items="${list }" var="i">
						<div class="div-row ">
							<div class="div-cell">${i.eid }</div>
							<div class="div-cell">${i.ename }</div>
							<div class="div-cell">${eage }</div>
							<div class="div-cell">${i.ehiredate }</div>
							<div class="div-cell">${i.eaddr }</div>
							<div class="div-cell">${i.ebirth }</div>
							<div class="div-cell">
								<select id="egrade" name="egrade" onchange="egradeCh(${i.eno},'${i.ename}', this.value)">
									<optgroup label="선택하세요.">
										<option value="0" <c:if test="${i.egrade eq 0}">selected="selected"</c:if>>사원</option>
										<option value="1" <c:if test="${i.egrade eq 1}">selected="selected"</c:if>>주임</option>
										<option value="2" <c:if test="${i.egrade eq 2}">selected="selected"</c:if>>대리</option>
										<option value="3" <c:if test="${i.egrade eq 3}">selected="selected"</c:if>>과장</option>
										<option value="4" <c:if test="${i.egrade eq 4}">selected="selected"</c:if>>차장</option>
										<option value="5" <c:if test="${i.egrade eq 5}">selected="selected"</c:if>>부장</option>
										<option value="6" <c:if test="${i.egrade eq 6}">selected="selected"</c:if>>부사장</option>
										<option value="7" <c:if test="${i.egrade eq 7}">selected="selected"</c:if>>사장</option>
										<option value="8" <c:if test="${i.egrade eq 8}">selected="selected"</c:if>>관리자</option>
									</optgroup>
								</select>
								
							</div>
						</div></c:forEach>
					</div>

</article>
</body>
</html>