<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>


<script type="text/javascript">

// 데이터 삽입

function init(){

	var f=document.forms[0]; // 폼의 배열 순서대로 숫자를 넣어줘야 한다. 0부터

	f.s1[0]=new Option("홍길동","길동"); // text(우리가 보는 텍스트), value(들어갈 데이터)

	f.s1[1]=new Option("이순신","순신");

	f.s1[2]=new Option("강갑찬","갑찬");

	f.s1[3]=new Option("한가인","가인");

	f.s1[4]=new Option("장동건","동건");

	f.s1[5]=new Option("고소영","소영");

}


function moveItem(arg){

	var f=document.forms[0];

	var source, target;

	if(arg=="left" || arg=="leftAll"){    // left 혹은 leftAll을 선택 했을 경우 source가 s2가 되고 target이 s1이 된다.

		source=f.s2;                

		target=f.s1;

	}else{                                // right혹은 rightAll을 선택 했을 경우 source가 s1가 되고 target이 s2이 된다.

		source=f.s1;

		target=f.s2;

	}

	

	var n=target.options.length;  // 선택한 갯수를 n값에 담는다.

	if(arg=="leftAll" || arg=="rightAll"){     // rightAll 혹은 leftAll을 선택 했을 경우

		for(var i=source.options.length-1; i>=0; i--){

			target[n++]=new Option(source[0].text,source[0].value);

			source[0]=null;

		}

		return;

	}

	

	// left, right 선택시에 작동하는 함수

	var len=source.options.length;

	for(var i=0; i<len; i++){

		if(source.options[i].selected){    // 해당값이 선택되어 있다면 source에 있는 값들을 target배열에 대입한다.

			target[n++]=new Option(source[i].text,source[i].value);

			source[i]=null;                    // target에 값을 대입한 source배열의 데이터는 null로 바꾸어 없앤다.

			len--;                                // 이동한 데이터가 순서대로 정렬하기 위한 작업

			i--;

		}

	}

}


function add(){

//	var f=document.forms[1]; // 숫자 1은 폼이 존재하는 순서에 따른 값을 넣어줬다. 2번째 있는 form에 적용하기 위해 1. 첫번째가 0부터 시작이다.

     var f=document.descForm.value;
	var v=f.insname.value;

	if(! v){

		return;

	}

	

	var idx=f.sel.options.length;  // 현재 옵션의 갯수를 구한다.

	f.sel[idx]=new Option(":"+v+":",v); // text(우리가 보는 텍스트), value(들어갈 데이터)

//	f.sel[idx]=new Option(v,v); //text, value

	f.ff.value="";

	return;

}


function del(){

	var f=document.forms[1];

	if(! f.sel.value){ // 선택된것이 없으면

		return;

	}

	

	if(confirm(f.sel.value+"항목을 지우시겠습까?")){

		f.sel[f.sel.selectedIndex] = null; //   selectedIndex 선택항목 인덱스

	}

}

	

</script>

</head>

<body onload="init();"> 

<!-- 실행과 동시에 적용(init()메소드를 호출) -->

<form name="searchform"action="">

<table>

<tr>

	<td>

		<select name="s1" multiple="multiple" style="width: 200px; height: 150px;"></select>

	</td>

	<td>

		<input type="button" value=">" onclick="moveItem('right');"><br/>

		<input type="button" value=">>" onclick="moveItem('rightAll');"><br/>

		<input type="button" value="<" onclick="moveItem('left');"><br/>

		<input type="button" value="<<" onclick="moveItem('leftAll');"><br/>

	</td>

	<td>

		<select name="s2" multiple="multiple" style="width: 200px; height: 150px;"></select>

	</td>

</tr>

</table>

</form>

<br/><br/>

<form name="descForm" action="">

	<select name="sel"></select><br/>

	<input type="text" name="insname">

	<input type="button" onclick="add();" value="추가">  <!-- 추가버튼 누르면 add() 메소드를 부른다 -->

	<input type="button" onclick="del();" value="삭제">

</form>


</body>

</html>
