<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<script >
function categoryChange(e) {
	  var good_a = ["지수", "제니", "로제", "리사"];
	  var good_b = ["빅토리아", "엠버", "루나", "크리스탈"];
	  var good_c = ["LE", "하니", "정화", "혜린", "솔지"];
	  var target = document.getElementById("good");
	 
	  if(e.value == "a") var d = good_a;
	  else if(e.value == "b") var d = good_b;
	  else if(e.value == "c") var d = good_c;
	 
	  target.options.length = "";
	  console.log(target.options.length);
	 
 	  for (z in d) {
	    var opt = document.createElement("option");
	    console.log(opt);
	    opt.value = d[z];
	    opt.innerHTML = d[z];
	    target.appendChild(opt);
	  }  
	}


</script>
<body>
<h2>게시판 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="40%"/>
		<col width="40"/>
		<col width="40%"/>
		<col width="40%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.IDX }</td>
						<td>${row.TITLE }</td>
						<td>${row.HIT_CNT }</td>
						<td>${row.CREA_DTM }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="9">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
</table>
<select onchange="categoryChange(this)">
  <option>걸그룹을 선택해주세요</option>
  <option value="a">블랙핑크</option>
  <option value="b">에프엑스</option>
  <option value="c">EXID</option>
</select>
 
<select id="good">
<option>좋아하는 멤버를 선택해주세요</option>
</select>



</body>
</html>