
/*
	계산기 원리
	1. 사용자가 버튼을 눌러 화면에 숫자가 나옴
	2. 숫자입력이 끝난 후 연산버튼을 눌렀을때 일어나는 현상
		- 처음 입력한 값은 어느 공간에 저장이 되도록 해야함
		- 그리고 처음 입력한 숫자 초기화
	3. 그리고 반복인데 + - x ÷ 스위치문으로 작성해서 진행?
		
 */

var txt2 = document.querySelector("#test"); // 위
var txt1 = document.getElementById("view"); // 아래
var result = document.querySelector("#result");

var num = 0;

// 함수기능 : Text 박스에 숫자표시만 함
function btnNum(a){
	txt1.value += a; // 화면에 누적해서 표시
}

// 함수기능 : 처음 입력했던 숫자들을 연산버튼이 무엇인지에 따라 계산
var calKind;

function calc(b){
	var firstNum = txt1.value;
	num = firstNum;
	calKind = b;
	txt1.value = "";
}

var place = 0;

function lastView(){
	var secondNum = Number(txt1.value);
	switch(calKind){
		case '+':
			txt1.value = Number(num) + Number(secondNum);
			break;
		case '-':
			txt1.value = Number(num) - Number(secondNum);
			break;
		case 'x':
			txt1.value = Number(num) * Number(secondNum);
			break;
		case '÷':
			txt1.value = Number(num) / Number(secondNum);
			break;
	}
}
	
function numClear(){
	txt1.value = "";	
}

function dott(){
	txt1.value += ".";
}